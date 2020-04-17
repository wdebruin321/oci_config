# frozen_string_literal: true

module Puppet_X
  module EnterpriseModules
    module Oci
      # Docs
      # rubocop: disable Metrics/ClassLength
      class AssociatedProperty < Puppet::Property
        include Puppet_X::EnterpriseModules::Oci::Config
        include Puppet_X::EnterpriseModules::Settings
        extend Puppet_X::EnterpriseModules::Oci::Config
        extend Puppet_X::EnterpriseModules::Settings
        include EasyType
        include EasyType::ArrayProperty

        [:puppet_type, :association_name, :association_from, :association_to, :association_model, :association_add, :association_remove].each do |m|
          define_method m do
            self.class.send(m)
          end
        end

        ACTIVE_ASSOCIATIONS = %w[ACTIVE ATTACHED].freeze

        # rubocop: disable Metrics/AbcSize
        def before_destroy
          #
          # Most of the time, we access the list by only differentiation on compartment_id. Sometimes
          # hower the first parameter is the availability_domain.
          #
          first_parameter = client.method("list_#{association_name}s").parameters[0]
          if first_parameter == [:req, :availability_domain]
            assoc_data = client.send("list_#{association_name}s",
                                     provider.availability_domain,
                                     provider.compartment_id,
                                     association_from => provider.id).data
          elsif first_parameter == [:req, :compartment_id]
            assoc_data = client.send("list_#{association_name}s",
                                     provider.compartment_id,
                                     association_from => provider.id).data
          else
            fail 'Internal error, we only support compartment or availability_domain as first parameter'
          end
          assoc_ids = assoc_data.select { |e| ACTIVE_ASSOCIATIONS.include?(e.lifecycle_state) }.collect(&association_to)
          assoc_ids.each { |r| remove_record_by_id(r) }
        end
        # rubocop: enable Metrics/AbcSize

        def self.client(tenant)
          ServiceInfo.type_to_client(puppet_type).new(:proxy_settings => proxy_config(tenant), :config => tenant_config(tenant), :retry_config => retry_config)
        end

        def self.puppet_type
          to_s.split('::')[2].downcase.to_sym
        end

        def self.association(assoc = nil)
          if assoc
            @assoc = assoc
          else
            @assoc
          end
        end

        def self.association_name
          @assoc.keys.first
        end

        def self.association_from
          @assoc[association_name][:from]
        end

        def self.association_model
          @assoc[association_name][:model]
        end

        def self.association_to
          @assoc[association_name][:to]
        end

        def self.association_add
          @assoc[association_name][:add]
        end

        def self.association_remove
          @assoc[association_name][:remove]
        end

        def resolver
          Puppet_X::EnterpriseModules::Oci::NameResolver.instance(resource.tenant)
        end

        private

        def resource_type
          name[0...-1].to_sym
        end

        def client
          ServiceInfo.type_to_client(puppet_type).new(:proxy_settings => proxy_config(resource.tenant), :config => tenant_config(resource.tenant), :retry_config => retry_config)
        end

        def remove_record_by_name(name)
          Puppet.debug "Removing #{resource_type} #{name} from #{resource.name}"
          record_id = resolver.name_to_ocid(resource.tenant, name, resource_type)
          remove_record_by_id(record_id)
        end

        # rubocop: disable Metrics/AbcSize
        def remove_record_by_id(id)
          Puppet.debug "Removing association between #{resource.name} and #{id}"
          first_parameter = client.method("list_#{association_name}s").parameters[0]
          if first_parameter == [:req, :availability_domain]
            association = client.send("list_#{association_name}s",
                                      provider.availability_domain,
                                      provider.compartment_id,
                                      association_to => id,
                                      association_from => provider.id).data.select(&:present?).first
          elsif first_parameter == [:req, :compartment_id]
            association = client.send("list_#{association_name}s",
                                      provider.compartment_id,
                                      association_to => id,
                                      association_from => provider.id).data.select(&:present?).first
          else
            fail 'Internal error, we only support compartment or availability_domain as first parameter'
          end
          resource.handle_oci_request(association_name, true, association.id) { client.send(association_remove, association.id) }
        end

        def add_record(record, data = {})
          #
          # OCI returns the value attachment_type, but doesn't allow it on update so
          # we change it to type
          #
          if data['attachment_type']
            data['type'] = data['attachment_type']
            data.delete('attachment_type')
          end
          Puppet.debug "Adding record #{record} to #{resource.name}"
          record_id = resolver.name_to_ocid(resource.tenant, record, resource_type)
          association_data = data.merge(association_to => record_id, association_from => provider.id)
          details = association_model.new(association_data)
          resource.handle_oci_request(association_name, true) { client.send(association_add, details) }
        end
        # rubocop: enable Metrics/AbcSize
      end
      # rubocop: enable Metrics/ClassLength
    end
  end
end
