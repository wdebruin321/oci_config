# frozen_string_literal: true

#
# See the file "LICENSE" for the full license governing this code.
#
require "#{File.dirname(__FILE__)}/core"
#
# List all resources and apply selected filer to it. The filter block must return true
# for evert entry you want. The fields variable selects the fields in puppet syntax (lowercase with underscore)
# that you want returned in the fact. If however fields is an empty array or nil, **ALL** the fieldss are returned.
#
def list_for_resource(type, fields, &filter)
  object_class = Puppet_X::EnterpriseModules::Oci::ServiceInfo.type_to_class(type)
  resource_list = configuration.keys.collect do |tenant|
    next unless settings_for(tenant)['facts'].any? { |f| type.to_s.=~ Regexp.new(f) }

    lister = Puppet_X::EnterpriseModules::Oci::ResourceLister.new(tenant, object_class)
    lister.resource_list.select(&:present?).collect do |resource|
      hash = resource.to_hash.to_puppet
      name = hash['name'] || hash['display_name']
      full_name = "#{tenant} (root)/#{name}"
      next if filter && !filter.call(full_name, hash)

      if fields.nil? || fields.empty?
        [full_name, hash]
      else
        [full_name, hash.select { |key, _| fields.include?(key) }]
      end
    end
  end.flatten(1).compact
  resource_list.empty? ? nil : resource_list.to_h
end

#
# Define a fact based on a OCI resource
#
def oci_define_fact(type_name, fields, &filter)
  Facter.add(type_name) do
    confine do
      File.exist?('/etc/oci_tenant.yaml')
    end

    extend Puppet_X::EnterpriseModules::Oci::Settings
    extend Puppet_X::EnterpriseModules::Oci::Config

    setcode do
      list_for_resource(type_name, fields, &filter)
    rescue OCI::Errors::ServiceError => e
      #
      # If we are not autorized, return an empty Hash and leave the property blank
      #
      raise unless e.service_code == 'NotAuthorizedOrNotFound'

      Puppet.debug "Skip fetching fact #{type_name} because of an authorization failure."
    end
  end
end
