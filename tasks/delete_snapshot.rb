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
class DeleteFileSystemSnapshotTask < Puppet_X::EnterpriseModules::Oci::PuppetTask
  parameter :namer
  oci_info  :name # The variable used to fetch the tenant info

  client    OCI::FileStorage::FileStorageClient

  def call_oci
    ocid = @resolver.name_to_ocid(@tenant, @name, :filesystem)
    @client.delete_snapshot(ocid)
    ocid
  end
end

DeleteFileSystemSnapshotTask.run if __FILE__ == $PROGRAM_NAME
