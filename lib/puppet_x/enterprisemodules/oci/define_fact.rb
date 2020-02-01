#
# See the file "LICENSE" for the full license governing this code.
#
require "#{File.dirname(__FILE__)}/core"
#
# List all resources and apply selected filer to it. The filter block must return true
# for evert entry you want. The fields variable selects the fields in puppet syntax (lowercase with underscore)
# that you want returned in the fact
#
def list_for_resource(type, fields, &filter)
  extend Puppet_X::EnterpriseModules::Settings
  extend Puppet_X::EnterpriseModules::Oci::Config

  object_class = Puppet_X::EnterpriseModules::Oci::ServiceInfo.type_to_class(type)
  resource_list = configuration.keys.collect do |tenant|
    lister = Puppet_X::EnterpriseModules::Oci::ResourceLister.new(tenant, OCI::Core::Models::PublicIp)
    lister.resource_list.collect do |resource|
      hash = resource.to_hash.to_puppet
      name = hash['name'] ? hash['name'] : hash['display_name']
      full_name = "#{tenant} (root)/#{name}"
      next if filter && !filter.call(full_name, hash)
      [full_name,hash.select { |key,_| fields.include?(key) }]
    end
  end.flatten(1).compact
  Hash[resource_list]
end

#
# Define a fact based on a OCI resource
#
def oci_define_fact(type_name, fields, &filter)

  Facter.add(type_name) do
    setcode do
      list_for_resource(type_name, fields, &filter)
    end
  end
end
