# frozen_string_literal: true

#
# See the file "LICENSE" for the full license governing this code.
#
newparam(:name) do
  include EasyType
  extend Puppet_X::EnterpriseModules::Oci::Config
  extend Puppet_X::EnterpriseModules::Oci::Settings

  desc <<-DESC
    The full name of the tag.
  DESC

  isnamevar

  data_type('String[1]')

  to_translate_to_resource do |raw_resource|
    tenant = raw_resource['tenant']
    resolver = Puppet_X::EnterpriseModules::Oci::NameResolver.instance(tenant)
    compartment = resolver.ocid_to_full_name(tenant, nil)
    tag_namespace_name = raw_resource['tag_namespace_name']
    name = raw_resource['name']
    "#{compartment}/#{tag_namespace_name}:#{name}"
  end
end
