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
class CreateFileSystemSnapshotTask < Puppet_X::EnterpriseModules::Oci::PuppetTask
  parameter :source
  parameter :name
  parameter :defined_tags,  {}
  parameter :freeform_tags, {}
  oci_info  :source # The variable used to fetch the tenant info

  client    OCI::FileStorage::FileStorageClient

  def call_oci
    source_ocid = @resolver.name_to_ocid(@tenant, @source, :filesystem)
    create_snapshot_details = OCI::FileStorage::Models::CreateSnapshotDetails.new(
      :file_system_id => source_ocid,
      :name => @name,
      :defined_tags => @defined_tags,
      :freeform_tags => @freeform_tags
    )
    @client.create_snapshot(create_snapshot_details).data
  end
end

CreateFileSystemSnapshotTask.run if __FILE__ == $PROGRAM_NAME
