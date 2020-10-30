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
    tenant = raw_resource['tenant']
    resolver = Puppet_X::EnterpriseModules::Oci::NameResolver.instance(tenant)
    compartment = resolver.ocid_to_full_name(tenant, raw_resource['compartment_id'])
    tag_definition = raw_resource['tag_definition_name']
    tag_namespace = resolver.ocid_to_name(tenant, raw_resource['tag_namespace_id'])
    "#{compartment}/#{tag_namespace}:#{tag_definition}"
  end
end
