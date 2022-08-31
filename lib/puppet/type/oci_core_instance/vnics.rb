# frozen_string_literal: true

#
# See the file "LICENSE" for the full license governing this code.
#
newproperty(:vnics, :parent => Puppet_X::EnterpriseModules::Oci::AssociatedHashProperty) do
  desc ''
  data_type('Hash[String[1], Any]')
  def before_create
    primary_nic = value.select { |_k, v| v['is_primary'] == true }
    fail 'More then 1 primary VNic declared' if primary_nic.size > 1

    nic_info = primary_nic.values.first.merge(:display_name => primary_nic.keys.first)
    nic_info['subnet_id'] = resolver.name_to_ocid(resource.tenant, nic_info['subnet'], :subnet) if nic_info['subnet']
    resource.oci_api_data['create_vnic_details'] = OCI::Core::Models::CreateVnicDetails.new(nic_info)
  end

  def before_destroy
    # Nothing. Don't destroy the vnic's. Let OCI handle this
  end

  def after_apply
    # TODO: Do nothing for now
  end

  def self.resource_name(tenant, record)
    net_client = client_for(OCI::Core::VirtualNetworkClient, tenant)
    @vnic_data = net_client.get_vnic(record.vnic_id).data
    @vnic_data.display_name
  end

  def self.resource_data(tenant, record)
    resolver = Puppet_X::EnterpriseModules::Oci::NameResolver.instance(tenant)
    hash = record.to_hash.merge(@vnic_data.to_hash)
    hash['subnet'] = resolver.ocid_to_name(tenant, record.subnet_id)
    hash = hash.reject { |k, v| k =~ /Ids?$/ || [:id, :lifecycleState, :timeCreated, :displayName].include?(k) || v == {} }
    hash.to_puppet
  end

  association :vnic_attachment => { :from => :instance_id, :to => :vnic_id, :model => OCI::Core::Models::AttachVnicDetails, :remove => :detach_vnic, :add => :attach_vnic }
end
