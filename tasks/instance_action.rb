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
  parameter :max_retries, 1
  oci_info  :instance_name
  client    OCI::Core::ComputeClient

  def call_oci
    retries = 0
    ocid = if @instance_name
             @resolver.name_to_ocid(@tenant, @instance_name, :instance)
           else
             @instance_id
           end
    begin
      @client.instance_action(ocid, @action).data
    rescue OCI::Errors::ServiceError
      retries += 1
      retry if retries <= @max_retries
      raise
    end
  end
end

InstanceActionTask.run if __FILE__ == $PROGRAM_NAME
