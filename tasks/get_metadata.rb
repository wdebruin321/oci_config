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
class GetMetadataTask < Puppet_X::EnterpriseModules::Oci::PuppetTask
  parameter :resource_name
  parameter :resource_id
  parameter :ocid_type
  parameter :field_selection
  parameter :max_retries, 1

  oci_info  :resource_name

  def call_oci
    retries = 0
    fail 'We need either a resource name or a resource id' if @resource_id.nil?

    ocid = if @resource_name
             @resolver.name_to_ocid(@tenant, @resource_name, @ocid_type.to_sym)
           else
             @resource_id
           end
    client = client_for(ServiceInfo.id_to_client(@ocid_type.to_sym), @tenant)
    begin
      data = client.send("get_#{@ocid_type}", ocid).data.to_hash.to_puppet
    rescue OCI::Errors::ServiceError
      retries += 1
      retry if retries <= @max_retries
      raise
    end
    @field_selection.nil? ? data : data[*@field_selection.split('.')]
  end
end

GetMetadataTask.run if __FILE__ == $PROGRAM_NAME
