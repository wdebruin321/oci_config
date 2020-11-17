# frozen_string_literal: true

#
# See the file "LICENSE" for the full license governing this code.
#
newparam(:name) do
  include EasyType
  extend Puppet_X::EnterpriseModules::Oci::Config
  extend Puppet_X::EnterpriseModules::Oci::Settings

  desc <<-DESC
  The full name of the object.
  DESC

  isnamevar

  data_type('String[1]')

  to_translate_to_resource do |raw_resource|
    require 'byebug';debugger
    tenant = raw_resource['tenant']
    client = client_for(OCI::FileStorage::FileStorageClient, tenant)
    export_set_id = raw_resource['export_set_id']
    export_set_info = client.get_export_set(export_set_id).data
    compartment_id = export_set_info.compartment_id
    resolver = Puppet_X::EnterpriseModules::Oci::NameResolver.instance(tenant)
    name = raw_resource['path']
    compartment = resolver.ocid_to_full_name(tenant, compartment_id)
    "#{compartment}:#{name}"
  end
end
