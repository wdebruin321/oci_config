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
class CreateBlockVolumeBackupTask < Puppet_X::EnterpriseModules::Oci::PuppetTask
  parameter :source
  parameter :destination
  parameter :type,          'FULL'
  parameter :defined_tags,  {}
  parameter :freeform_tags, {}
  oci_info  :source # The variable used to fetch the tenant info

  client    OCI::Core::BlockstorageClient

  def call_oci
    source_ocid = @resolver.name_to_ocid(@tenant, @source, :volume)
    create_volume_backup_details = OCI::Core::Models::CreateVolumeBackupDetails.new(
      :volume_id => source_ocid,
      :display_name => @destination,
      :type => @type,
      :defined_tags => @defined_tags,
      :freeform_tags => @freeform_tags
    )
    @client.create_volume_backup(create_volume_backup_details).data
  end
end

CreateBlockVolumeBackupTask.run if __FILE__ == $PROGRAM_NAME
