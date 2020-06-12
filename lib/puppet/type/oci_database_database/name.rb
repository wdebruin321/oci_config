# frozen_string_literal: true

#
# See the file "LICENSE" for the full license governing this code.
#
newparam(:name) do
  include EasyType

  desc <<-DESC
  The full name of the object.
  DESC

  isnamevar

  data_type('String[1]')

  to_translate_to_resource do |raw_resource|
    tenant = raw_resource['tenant']
    db_system_id = raw_resource['db_system_id']
    resolver = Puppet_X::EnterpriseModules::Oci::NameResolver.instance(tenant)
    db_name = raw_resource['db_name']
    db_system_name = resolver.ocid_to_full_name(tenant, db_system_id)
    "#{db_system_name}:#{db_name}"
  end
end
