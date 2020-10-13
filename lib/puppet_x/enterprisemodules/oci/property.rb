# frozen_string_literal: true

module Puppet_X
  module EnterpriseModules
    module Oci
      # Docs
      class Property < Puppet::Property
        include EasyType

        def self.reference_type(type = nil)
          if type
            @reference_type = type
          else
            @reference_type
          end
        end

        def self.references(reference = nil)
          if reference
            @reference = reference
          else
            @reference
          end
        end

        def references
          self.class.references
        end

        def reference_type
          self.class.reference_type
        end

        # rubocop: disable Naming/MethodParameterName
        def insync_values?(is, should)
          if should.is_a?(Hash)
            value = is == :absent ? {} : is
            should.only_change_diff(value) == {}
          elsif should.is_a?(Array) && self.class.data_type.to_s.scan(/Oci_|Hash\[/) # Means we are an array containing hashes
            return false unless is.is_a? Array

            # If they were different lengths, they are not equal.
            return false unless is.length == should.length

            is.each_with_index.all? { |_v, i| insync_values?(is[i], should[i]) }
          else
            is.to_s == should.to_s
          end
        end

        def insync?(is)
          insync_values?(is, should)
        end
        # rubocop: enable Naming/MethodParameterName

        def before_apply
          resource.oci_api_data[references] = reference_to_id(value, reference_type) if references
          fill_in_reference_in_enumerable(resource.oci_api_data[name]) if reference_attributes.any?
        end

        def fill_in_reference_in_enumerable(data)
          return data.each { |v| fill_in_reference_in_enumerable(v) } if data.is_a?(Array)

          reference_attributes.each do |property|
            if property == 'id'
              reference_property = 'name'
              property_type = data['type'].downcase
            else
              reference_property = property.scan(/(.*)_id(s)?/).flatten.join
              property_type = data["#{reference_property}_type"]
              property_type ||= reference_property[-1] == 's' ? reference_property [0...-1] : reference_property
            end
            if data[reference_property].is_a?(Array)
              data[reference_property].each { |v| fill_in_reference_in_enumerable(v) }
              next
            end
            next unless data[reference_property]

            #
            # Translate the reference to the id and then make sure the reference property is removed
            # The OCI api fails if it is still there.
            #
            # We use the type if it is specified, if not specified, we infer a type based on
            # the singular version of the property.
            #
            data[property] = reference_to_id(data[reference_property], property_type.to_sym)
            data.delete(reference_property)
            data.delete("#{reference_property}_type")
          end
        end

        def reference_attributes
          self.class.data_type.to_alias_expanded_s.scan(/'(\w*?_ids?|id)'/).flatten
        end

        def reference_to_id(reference, type)
          #
          # If a name is specified translate it to an id before the create or update
          # is called.
          #
          resolver = Puppet_X::EnterpriseModules::Oci::NameResolver.instance(resource.tenant)
          new_value = resolver.name_to_ocid(resource.tenant, reference, type)
          Puppet.debug "Translated name #{reference} to ocid #{new_value}"
          new_value
        rescue RuntimeError => e
          fail "#{resource.path}: Error translating reference #{reference} to ocid: #{e.message}"
        end

        def self.resolver
          @resolver ||= Puppet_X::EnterpriseModules::Oci::NameResolver.instance(@tenant)
        end

        def self.fill_in_references(value)
          return value.collect { |v| fill_in_references(v) } if value.is_a?(Array)

          if value.is_a?(Hash)
            value.keys.grep(/_ids?|^id$/).each do |key|
              begin
                if key == 'id'
                  new_key = 'name'
                else
                  new_key = key.scan(/(.*)_id(s)?|id$/).flatten.join
                  value["#{new_key}_type"] = resolver.id_type(value[key]).to_s
                end
                value[new_key] = resolver.ocid_to_name(@tenant, value[key])
              rescue  RuntimeError => e
                #
                # TODO: make the resolver throw a real error, so it is easier to catch here.
                #
                raise unless e.message =~ /Object with .* not found/

                value[new_key] = e.message
              rescue OCI::Errors::ServiceError => e
                #
                # If we are not autorized, return an empty Hash and leave the property blank
                #
                raise unless e.service_code == 'NotAuthorizedOrNotFound'

                Puppet.debug "Skip fetching property '#{name}'' because of an authorization failure."
              end
            end
            if value.keys.include?('id')
              begin
                value['name'] = resolver.ocid_to_name(@tenant, value['id'])
              rescue OCI::Errors::ServiceError => e
                #
                # If we are not autorized, return an empty Hash and leave the property blank
                #
                raise unless e.service_code == 'NotAuthorizedOrNotFound'

                Puppet.debug "Skip fetching property 'id' because of an authorization failure."
              rescue RuntimeError => e
                #
                # If we fetch an unkown if, just continue
                #
                raise unless e.message =~ /Object with .* not found/

                Puppet.debug "Skip fetching property 'id' because of an unkown or not existing reference."
              end
            end
          end
          value
        end

        def self.translate_to_resource(raw_resource, partial_resource)
          @tenant = raw_resource['tenant']
          value = if @reference && (raw_resource[@reference.to_s] || partial_resource[@reference])
                    ocid = raw_resource[@reference.to_s] || partial_resource[@reference]
                    begin
                      Puppet.debug "Resolving id for #{name}"
                      ocid ? resolver.ocid_to_name(@tenant, ocid) : nil
                    rescue StandardError
                      #
                      # Sometimes because of timing issues, a reference to an unkown ocid is found.
                      # In these cases we don't want to fail, but just return the bara information.
                      #
                      #
                      "References unkown ocid: #{ocid}"
                    end
                  else
                    raw_resource[name.to_s]
                  end
          fill_in_references(value)
        end
      end
    end
  end
end
