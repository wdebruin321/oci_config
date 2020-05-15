# frozen_string_literal: true

module Puppet_X
  module EnterpriseModules
    module Oci
      # Docs
      class AssociatedHashProperty < AssociatedProperty
        #
        # Print a good change message when changing the contents of an array
        #
        # rubocop: disable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
        def change_to_s(current, should)
          return if insync?(current)

          messages = []
          messages << "removing #{removed_records.join(', ')}" if removed_records.any?
          messages << "adding #{added_records.join(', ')}" if added_records.any?
          all_changes = should.only_change_diff(current_value)
          all_changes.each do |resource, resource_changes|
            resource_changes.each do |property, change|
              next if property.nil? || change.nil?

              change[0] = change[0].nil? ? :absent : change[0]
              change[1] = change[1].nil? ? :absent : change[1]
              messages << "changing #{property} of #{resource} from #{change[1]} to #{change[0]}"
            end
          end
          messages.join(' and ') << '.'
        end
        # rubocop: enable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity

        def insync?(_)
          should.only_change_diff(current_value).values.all? { |v| v == {} }
        end

        def after_apply
          (removed_records + updated_records).each { |r| remove_record_by_name(r) }
          (added_records + updated_records).each { |r| add_record(r, requested_value[r]) }
        end

        # rubocop: disable Metrics/AbcSize
        def self.translate_to_resource(raw_resource, _resource)
          resource_id         = raw_resource['id']
          tenant              = raw_resource['tenant']
          compartment_id      = raw_resource['compartment_id']
          availability_domain = raw_resource['availability_domain']
          assoc_records = case association_to
                          when :boot_volume_id
                            client(tenant).send("list_#{association_name}s", availability_domain, compartment_id, association_from => resource_id).data.select(&:present?)
                          else
                            client(tenant).send("list_#{association_name}s", compartment_id, association_from => resource_id).data.select(&:present?)
                          end
          assoc_records.each_with_object({}) do |assoc_record, value|
            Puppet.debug "Resolving resource name for #{assoc_record.puppet_name}"
            value[resource_name(tenant, assoc_record)] = resource_data(tenant, assoc_record)
          end
        rescue OCI::Errors::ServiceError => e
          #
          # If we are not autorized, return an empty Hash and leave the property blank
          #
          raise unless e.service_code == 'NotAuthorizedOrNotFound'

          Puppet.debug "Skip fetching property #{name} because of an authorization failure."
          {}
        end
        # rubocop: enable Metrics/AbcSize

        def self.resource_name(tenant, record)
          resolver = Puppet_X::EnterpriseModules::Oci::NameResolver.instance(tenant)
          resolver.ocid_to_name(tenant, record.send(association_to))
        end

        def self.resource_data(_tenant, record)
          data = record.to_hash.reject { |k, _v| k =~ /Ids?$/ || [:id, :lifecycleState, :timeCreated].include?(k) }
          data.to_puppet
        end

        private

        def current_value
          value = resource.to_resource.to_hash[name]
          value == :absent ? {} : value
        end

        def requested_value
          current_value.merge(should)
        end

        def current_records
          current_value.keys
        end

        def updated_records
          should.only_change_diff(current_value).select { |_k, v| v.is_a?(Hash) && !v.empty? }.keys
        end

        def removed_records
          current_records - value.keys
        end

        def added_records
          value.keys - current_records
        end
      end
    end
  end
end
