# frozen_string_literal: true

module Puppet_X
  module EnterpriseModules
    module Oci
      # Docs
      class AssociatedArrayProperty < AssociatedProperty
        def after_apply
          removed_records.each { |r| remove_record_by_name(r) }
          added_records.each { |r| add_record(r) }
        end

        # rubocop: disable Metrics/AbcSize
        def self.translate_to_resource(raw_resource, _resource)
          resource_id         = raw_resource['id']
          tenant              = raw_resource['tenant']
          compartment_id      = raw_resource['compartment_id']
          availability_domain = raw_resource['availability_domain']
          resolver            = Puppet_X::EnterpriseModules::Oci::NameResolver.instance(tenant)
          assoc_records = case association_to
                          when :boot_volume_id
                            client(tenant).send("list_#{association_name}s", availability_domain, compartment_id, association_from => resource_id).data.select(&:present?)
                          else
                            client(tenant).send("list_#{association_name}s", compartment_id, association_from => resource_id).data.select(&:present?)
                          end
          assoc_records.map(&association_to).collect do |assoc_id|
            Puppet.debug "Resolving resource name for #{assoc_id}"
            resolver.ocid_to_name(tenant, assoc_id)
          end
        rescue OCI::Errors::ServiceError => e
          #
          # If we are not autorized, return an empty Hash and leave the property blank
          #
          raise unless e.service_code == 'NotAuthorizedOrNotFound'

          Puppet.debug "Skip fetching property #{name} because of an authorization failure."
          []
        end
        # rubocop: enable Metrics/AbcSize

        private

        def current_records
          value = resource.to_resource.to_hash[name]
          value == :absent ? [] : value
        end

        def removed_records
          current_records - value
        end

        def added_records
          value - current_records
        end
      end
    end
  end
end
