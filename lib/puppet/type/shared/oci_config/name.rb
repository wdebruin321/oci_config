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
    compartment_id = raw_resource['compartment_id']
    name = raw_resource['name']
    name = raw_resource['display_name'] if name.nil?
    resolver = Puppet_X::EnterpriseModules::Oci::NameResolver.instance(tenant)
    compartment = resolver.ocid_to_full_name(tenant, compartment_id)
    "#{compartment}/#{name}"
  end
end
