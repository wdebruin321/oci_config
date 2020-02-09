#!/opt/puppetlabs/puppet/bin/ruby
# frozen_string_literal: true

#
#
# See the file "LICENSE" for the full license governing this code.
#
#
require 'json'
require 'open3'
require 'puppet'

# TODO: Docs
# docs
class CreateBlockVolumeBackupTask
  def self.run
    instance = new
    instance.run
  end

  def run
    fetch_input
    execute
  ensure
    report
  end

  # rubocop: disable Metrics/MethodLength, Metrics/AbcSize, Lint/SuppressedException
  def fetch_input
    params = JSON.parse(STDIN.read)
    if params.keys.include?('_installdir')
      #
      # Use loadpath specfied in the params
      #
      $LOAD_PATH << "#{params['_installdir']}/easy_type/lib"
      $LOAD_PATH << "#{params['_installdir']}/oci_config/lib"
    else
      begin
        Puppet.initialize_settings
      rescue Puppet::DevError
        # When run in Rspec, this is called multiple times
      end
    end
    require 'puppet_x/enterprisemodules/oci/core'
    extend Puppet_X::EnterpriseModules::Oci::Config
    extend Puppet_X::EnterpriseModules::Settings

    @source        = params.fetch('source')
    @destination   = params.fetch('destination')
    @type          = params.fetch('type')          { 'FULL' }
    @defined_tags  = params.fetch('defined_tags')  { {} }
    @freeform_tags = params.fetch('freeform_tags') { {} }
    @tenant        = @source.match(/^(.*) \(root\).*$/)[1]
    @resolver      = Puppet_X::EnterpriseModules::Oci::NameResolver.instance(@tenant)
    @client        = OCI::Core::BlockstorageClient.new(:config => tenant_config(@tenant), :retry_config => retry_config)
    @result        = {}
  end
  # rubocop: enable Metrics/MethodLength, Metrics/AbcSize, Lint/SuppressedException

  def report
    puts @result.to_json
  end

  def execute
    @source_ocid = @resolver.name_to_ocid(@tenant, @source, :volume)
    create_volume_backup_details = OCI::Core::Models::CreateVolumeBackupDetails.new(
      :volume_id => @source_ocid,
      :display_name => @destination,
      :type => @type,
      :defined_tags => @defined_tags,
      :freeform_tags => @freeform_tags
    )
    @client.create_volume_backup(create_volume_backup_details)
  rescue StandardError => e
    @result[:_error] = {
      :msg => e.message,
      :kind => 'enterprisemodules-oci_config/create_volume_backup'
    }
    raise e
  end
end

CreateBlockVolumeBackupTask.run if __FILE__ == $PROGRAM_NAME
