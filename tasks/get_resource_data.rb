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
  parameter :resource_id
  parameter :resource_type

  oci_info  :resource_name

  def call_oci
    object_class = ServiceInfo.type_to_class(@resource_type.to_sym)
    object_type  = object_class.to_s.split('::').last.underscore
    object_id    = ServiceInfo.type_to_id(@resource_type.to_sym)

    ocid = if @resource_name
             @resolver.name_to_ocid(@tenant, @resource_name, object_id)
           else
             @resource_id
           end
    client = client_for(ServiceInfo.type_to_client(@resource_type.to_sym), @tenant)
    client.send("get_#{object_type}", ocid).data
  end
end

GetResourceDataTask.run if __FILE__ == $PROGRAM_NAME
