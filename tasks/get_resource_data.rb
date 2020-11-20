#!/opt/puppetlabs/puppet/bin/ruby
# frozen_string_literal: true

#
#
# See the file "LICENSE" for the full license governing this code.
#
#
$LOAD_PATH << "#{__dir__}/../lib"
$LOAD_PATH << "#{__dir__}/../../easy_type/lib"
require 'puppet_x/enterprisemodules/oci/oci_task'
require 'puppet_x/enterprisemodules/oci/service_info'

ServiceInfo = Puppet_X::EnterpriseModules::Oci::ServiceInfo

# TODO: Docs
# docs
class GetResourceDataTask < Puppet_X::EnterpriseModules::Oci::PuppetTask
  parameter :resource_name
  parameter :puppet_type
  parameter :field_selection

  oci_info  :resource_name

  def call_oci
    Puppet[:codedir] = "#{__dir__}/.."
    Puppet[:vardir]  = '/tmp'

    puppet_type = Puppet::Type.type(@puppet_type)
    raise Puppet::Error,  'Selected puppet_type not found.' if puppet_type.nil?
    resource = puppet_type.new(:name => @resource_name, :ensure => 'present')
    data = puppet_type.execute_prefetch({ @resource_name => resource }, puppet_type.defaultprovider, :all_properties => true)
    raise Puppet::Error, "Resource #{@puppet_type}[#{@resource_name}] not found." if data[@resource_name].provider.ensure == :absent

    resource_data = data[@resource_name].provider.to_hash
    @field_selection.nil? ? resource_data : resource_data.stringify_keys.dig(*@field_selection.split('.'))
  end
end

GetResourceDataTask.run if __FILE__ == $PROGRAM_NAME
