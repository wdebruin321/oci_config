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

# TODO: Docs
# docs
class InstanceActionTask < Puppet_X::EnterpriseModules::Oci::PuppetTask
  parameter :instance_name
  parameter :instance_id
  parameter :action, 'START'
  oci_info  :instance_name
  client    OCI::Core::ComputeClient

  def call_oci
    ocid = if @instance_name
             @resolver.name_to_ocid(@tenant, @instance_name, :instance)
           else
             @instance_id
           end
    @client.instance_action(ocid, @action).data
  end
end

InstanceActionTask.run if __FILE__ == $PROGRAM_NAME
