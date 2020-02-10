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
class DeleteBlockVolumeBackupTask < Puppet_X::EnterpriseModules::Oci::PuppetTask
  parameter :volume_name
  oci_info  :volume_name
  client    OCI::Core::BlockstorageClient

  def call_oci
    ocid = @resolver.name_to_ocid(@tenant, @volume_name, :volumebackup)
    @client.delete_volume_backup(ocid).data
    ocid
  end
end

DeleteBlockVolumeBackupTask.run if __FILE__ == $PROGRAM_NAME
