# frozen_string_literal: true

module Puppet_X
  module EnterpriseModules
    module Oci
      # Docs
      # rubocop: disable Metrics/ClassLength
      class ResourceLister
        include Config
        include Settings

        def initialize(tenant, object_class)
          @tenant        = tenant
          @object_class  = object_class
          @object_type   = @object_class.to_s.split('::').last.underscore
          @resource_type = @object_class.to_s.gsub('::Models', '').split('::').join('_').underscore.to_sym
          @resolver = Puppet_X::EnterpriseModules::Oci::NameResolver.instance(tenant)
        end

        # rubocop: disable Metrics/CyclomaticComplexity, Metrics/MethodLength
        def resource_list(compartment_id = nil)
          all_resources = case ServiceInfo.type_to_lookup_method(@resource_type)
                          when :root
                            resources_at_root
                          when :vcn
                            resources_in_vncs(compartment_id)
                          when :protocol
                            resources_in_protocol(compartment_id)
                          when :availability_domains
                            resources_in_availability_domains(compartment_id)
                          when :compartment
                            resources_in_compartments(compartment_id)
                          when :compartment_detailed
                            resources_in_compartments(compartment_id, true)
                          when :vault
                            resources_in_vaults(compartment_id)
                          when :namespace
                            resources_in_namespace(compartment_id)
                          else
                            fail "Internal error: invalid primary_key for #{@resource_type}"
                          end
          all_resources.select(&:present?)
        end
        # rubocop: enable Metrics/CyclomaticComplexity, Metrics/MethodLength

        private

        def resources_at_root
          Puppet.debug 'Inspecting root...'
          client.send("list_#{object_type_plural}").data
        end

        # rubocop: disable Metrics/AbcSize
        def resources_in_compartments(specified_compartment, details_get = false)
          compartment_list = specified_compartment.nil? ? @resolver.compartments(@tenant).map(&:id) : [specified_compartment]
          compartment_list.collect do |compartment_id|
            Puppet.debug "Inspecting compartment #{@resolver.ocid_to_full_name(@tenant, compartment_id)} for #{object_type_plural}..."
            case object_type_plural
            when 'exports'
              #
              # Copy the content of the path variable to name to make pupet happy
              #
              summary_data = client.list_exports(:compartment_id => compartment_id).data
              summary_data.collect do |export|
                client.get_export(export.id).data
              end
            when 'public_ips'
              client.list_public_ips('REGION', compartment_id, :lifetime => 'RESERVED').data
            else
              summary_data = client.send("list_#{object_type_plural}", compartment_id).data
              if details_get
                summary_data.collect { |s| client.send("get_#{@object_type}", s.id).data }
              else
                summary_data
              end
            end
          end.flatten.compact.uniq(&:id)
        end
        # rubocop: enable Metrics/AbcSize

        # rubocop: disable Metrics/AbcSize
        def resources_in_protocol(specified_compartment)
          compartment_list = specified_compartment.nil? ? @resolver.compartments(@tenant).map(&:id) : [specified_compartment]
          compartment_list.collect do |compartment_id|
            Puppet.debug "Inspecting compartment #{@resolver.ocid_to_full_name(@tenant, compartment_id)} for #{object_type_plural}..."
            Puppet.debug 'Inspecting protocol SAML2...'
            client.send("list_#{object_type_plural}", 'SAML2', compartment_id).data
          end.flatten.compact.uniq(&:id)
        end
        # rubocop: enable Metrics/AbcSize

        # rubocop: disable Metrics/AbcSize
        def resources_in_vncs(specified_compartment)
          compartment_list = specified_compartment.nil? ? @resolver.compartments(@tenant).map(&:id) : [specified_compartment]
          compartment_list.collect do |compartment_id|
            Puppet.debug "Inspecting compartment #{@resolver.ocid_to_full_name(@tenant, compartment_id)} for #{object_type_plural}..."
            vncs_in(compartment_id).collect do |vnc_id|
              Puppet.debug "Inspecting vnc #{vnc_id}..."
              client.send("list_#{object_type_plural}", compartment_id, vnc_id).data
            end
          end.flatten.compact.uniq(&:id)
        end
        # rubocop: enable Metrics/AbcSize

        # rubocop: disable Metrics/AbcSize
        def resources_in_namespace(specified_compartment)
          namespace = client.get_namespace.data
          compartment_list = specified_compartment.nil? ? @resolver.compartments(@tenant).map(&:id) : [specified_compartment]
          compartment_list.collect do |compartment_id|
            Puppet.debug "Inspecting compartment #{@resolver.ocid_to_full_name(@tenant, compartment_id)} for #{object_type_plural}..."
            buckets = client.list_buckets(namespace, compartment_id).data
            buckets.collect { |b| client.get_bucket(namespace, b.name).data }
          end.flatten.compact.uniq(&:name)
        end
        # rubocop: enable Metrics/AbcSize

        # rubocop: disable Metrics/AbcSize
        def resources_in_vaults(specified_compartment)
          compartment_list = specified_compartment.nil? ? @resolver.compartments(@tenant).map(&:id) : [specified_compartment]
          compartment_list.collect do |compartment_id|
            Puppet.debug "Inspecting compartment #{@resolver.ocid_to_full_name(@tenant, compartment_id)} for #{object_type_plural}..."
            vaults_in(compartment_id).collect do |vault|
              kms_management_client = OCI::KeyManagement::KmsManagementClient.new(:proxy_settings => proxy_config(@tenant),
                                                                                  :config => tenant_config(@tenant),
                                                                                  :endpoint => vault.management_endpoint,
                                                                                  :retry_config => retry_config)
              Puppet.debug "Inspecting vault #{vault.id}..."
              kms_management_client.send("list_#{object_type_plural}", compartment_id).data
            end
          end.flatten.compact.uniq(&:id)
        end
        # rubocop: enable Metrics/AbcSize

        # rubocop: disable Metrics/AbcSize
        def resources_in_availability_domains(specified_compartment)
          compartment_list = specified_compartment.nil? ? @resolver.compartments(@tenant).map(&:id) : [specified_compartment]
          compartment_list.collect do |compartment_id|
            Puppet.debug "Inspecting compartment #{@resolver.ocid_to_full_name(@tenant, compartment_id)} for #{object_type_plural}..."
            availability_domains_in(compartment_id).collect do |availability_domain|
              Puppet.debug "Inspecting availability domain #{availability_domain} for #{object_type_plural}..."
              case @object_type
              when 'file_system', 'mount_target'
                client.send("list_#{object_type_plural}", compartment_id, availability_domain).data
              else
                client.send("list_#{object_type_plural}", availability_domain, compartment_id).data
              end
            end
          end.flatten.compact.uniq(&:id)
        end
        # rubocop: enable Metrics/AbcSize

        def vncs_in(compartment_id)
          vcn_client = OCI::Core::VirtualNetworkClient.new(:proxy_settings => proxy_config(@tenant), :config => tenant_config(@tenant), :retry_config => retry_config)
          vcn_client.send('list_vcns', compartment_id).data.collect(&:id)
        end

        def vaults_in(compartment_id)
          vault_client = OCI::KeyManagement::KmsVaultClient.new(:proxy_settings => proxy_config(@tenant), :config => tenant_config(@tenant), :retry_config => retry_config)
          vault_client.send('list_vaults', compartment_id).data
        end

        def availability_domains_in(compartment_id)
          identity_client = OCI::Identity::IdentityClient.new(:proxy_settings => proxy_config(@tenant), :config => tenant_config(@tenant), :retry_config => retry_config)
          identity_client.send('list_availability_domains', compartment_id).data.collect(&:name)
        end

        def client
          @client ||= ServiceInfo.type_to_client(@resource_type).new(:proxy_settings => proxy_config(@tenant), :config => tenant_config(@tenant), :retry_config => retry_config)
        end

        def object_type_plural
          if @object_type[-1] == 's'
            @object_type
          elsif @object_type[-2..-1] == 'cy'
            "#{@object_type[0...-1]}ies"
          else
            "#{@object_type}s"
          end
        end
      end
      # rubocop: enable Metrics/ClassLength
    end
  end
end
