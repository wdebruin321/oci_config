# frozen_string_literal: true

require 'oci'

module Puppet_X
  module EnterpriseModules
    module Oci
      # Docs
      # rubocop: disable Metrics/ClassLength
      class NameResolver
        include Puppet_X::EnterpriseModules::Oci::Settings
        include Puppet_X::EnterpriseModules::Oci::Config

        private_class_method :new

        def initialize
          @clients      = {}
          @cache        = {}
          @cached_types = []
          @tenant_ids   = {}
        end

        def initialize_for_tenant(tenant)
          return if @clients[tenant]

          @clients[tenant]    = client_for(OCI::Identity::IdentityClient, tenant)
          #
          # If we are using an instance principal then use compartment_id as tenant
          #
          @tenant_ids[tenant] = @clients[tenant].api_client.config.tenancy || Facter.value(:oci_instance)['compartment_id']
          #
          # We now use a large limit, be we need to modify it to use multiple calls.
          #
          @cache[tenant] = @clients[tenant].list_compartments(@tenant_ids[tenant], :limit => 9_999_999, :access_level => 'ACCESSIBLE', :compartment_id_in_subtree => true).data
        end

        def self.instance(tenant)
          @instance ||= new
          @instance.initialize_for_tenant(tenant)
          @instance
        end

        def compartments(tenant)
          @cache[tenant].select { |o| o.compartment? && o.lifecycle_state == 'ACTIVE' }
        end

        def compartment_for_ocid(tenant, ocid)
          compartments(tenant).find { |e| e.id == ocid }
        end

        def id_type(ocid)
          ocid.scan(/ocid1\.(\w*)\./).first.first.to_sym
        end

        # rubocop: disable Metrics/AbcSize
        def from_cache(tenant, ocid)
          ocid_type = id_type(ocid)
          object = @cache[tenant].find { |e| e.id == ocid && e.id_type == ocid_type }
          return object if object

          unless @cached_types.include?(ocid_type)
            #
            # Fetch all objects of specified type
            #
            object_class = ServiceInfo.id_to_class(ocid_type)
            lister = ResourceLister.new(tenant, object_class)
            @cache[tenant] += lister.resource_list
            @cache[tenant].uniq(&:id) # remove duplicate from cache
            @cached_types << ocid_type
            object = @cache[tenant].find { |e| e.id == ocid && e.id_type == ocid_type }
          end
          fail "Object with #{ocid} not found." if object.nil?

          object
        end
        # rubocop: enable Metrics/AbcSize

        # rubocop: disable Metrics/AbcSize, Metrics/MethodLength, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
        def name_to_ocid(tenant, full_name, id_type = :compartment)
          return full_name.collect { |n| name_to_ocid(tenant, n, id_type) } if full_name.is_a?(Array)

          full_name = full_name.gsub('//', '/') # Handle double seperators
          tenancy, relative_name = full_name.scan(%r{^(?:(.*) \(root\)/)?(.*)?}).first
          return relative_name if valid_ocid?(relative_name)
          fail "tenancy #{tenancy} different than tenancy in name #{full_name}" if tenancy && tenant != tenancy

          compartment_name, name = relative_name.scan(%r{^(?:(.*)/)?(.*)$}).first
          compartment_id = if compartment_name.nil?
                             @tenant_ids[tenant]
                           else
                             name_to_ocid(tenant, compartment_name, :compartment)
                           end
          return compartment_id if name.empty?

          object = find_in_cache(tenant, id_type, name, compartment_id)
          if object.nil? # Not in cache, fetch it
            #
            # Fetch all objects of specified type
            #
            object_class = ServiceInfo.id_to_class(id_type)
            lister = ResourceLister.new(tenant, object_class)
            @cache[tenant] += lister.resource_list(compartment_id)
            @cache[tenant].uniq(&:id) # remove duplicate from cache
            object = find_in_cache(tenant, id_type, name, compartment_id)
          end
          fail "No #{id_type} found with name #{full_name}" if object.nil?

          object.id
        end
        # rubocop: enable Metrics/AbcSize, Metrics/MethodLength, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity

        # rubocop: disable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
        def find_in_cache(tenant, id_type, name, compartment_id)
          if compartment_id == @tenant_ids[tenant]
            @cache[tenant].find { |o| o.id_type == id_type && o.puppet_name == name && (o.compartment_id == compartment_id || o.compartment_id.nil?) }
          else
            @cache[tenant].find do |object|
              if object.respond_to?(:compartment_id)
                object.id_type == id_type && object.puppet_name == name && object.compartment_id == compartment_id
              else
                #
                # TODO: Check if there is a more acurate way to select an object_id on an object that
                # doesn't respond to compartment_id
                #
                object.id_type == id_type && object.puppet_name == name
              end
            end
          end
        end
        # rubocop: enable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity

        def compartment_ocid_to_name(tenant, ocid)
          compartment = @cache[tenant].find { |e| e.id == ocid }
          compartment.name
        end

        def compartment_parent(tenant, ocid)
          compartment = @cache[tenant].find { |e| e.id == ocid }
          compartment.compartment_id
        end

        def ocid_to_full_name(tenant, ocid)
          if ocid.nil? || tenant?(ocid)
            tenant_string(tenant)
          else
            "#{tenant_string(tenant)}/#{ocid_to_name(tenant, ocid)}"
          end
        end

        # rubocop: disable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
        def ocid_to_name(tenant, ocid)
          return ocid.collect { |i| ocid_to_name(tenant, i) } if ocid.is_a?(Array)
          return '/' if ocid.nil? || tenant?(ocid)

          object = from_cache(tenant, ocid)
          #
          # Because some objects from OCI don't have a name compartment, we check
          # first if the method exists.
          #
          compartment_id = object.respond_to?(:compartment_id) ? object.compartment_id : nil
          #
          # The name is prefarably fetched by the name attribute. If it doesn't exist,
          # we use the display_name.
          #
          name = object.respond_to?(:name) ? object.name : object.display_name
          return name if compartment_id.nil?

          names = [name]
          loop do
            break if tenant?(compartment_id)

            names.unshift(compartment_ocid_to_name(tenant, compartment_id))
            compartment_id = compartment_parent(tenant, compartment_id)
          end
          names.join('/')
        end
        # rubocop: enable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity

        def tenant?(ocid)
          ocid.scan(/ocid1\.(\w*)\./).first.first == 'tenancy'
        end

        def valid_ocid?(ocid)
          ocid.scan(/ocid1\..*/).any?
        end

        def tenant_string(tenant)
          "#{tenant} (root)"
        end
      end
    end
  end
  # rubocop: enable Metrics/ClassLength
end
