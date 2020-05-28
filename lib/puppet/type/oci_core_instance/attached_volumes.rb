# frozen_string_literal: true

#
# See the file "LICENSE" for the full license governing this code.
#
newproperty(:attached_volumes, :parent => Puppet_X::EnterpriseModules::Oci::AssociatedHashProperty) do
  desc <<-DESC
    The volumes your want ensure are connected to the instance. This is different from the
    regular `volumes` property in the sense that this is only about the specified
    volumes. It doesn't care about any other volumes attached. It doesn't describe the
    the full state, but only the partial state of this volume.
    
    Here is an example on how to use this:

        oci_core_instance { 'tenant (root)/my_instance':
          ensure              => 'present',
            .
            .
          attached_volumes             => {
            'compartment_name/my_volume_1' => {
              'attachment_type' => 'paravirtualized',
            }
        }

  DESC
  data_type('Optional[Hash[String[1], Any]]')

  def before_destroy
    # Do nothing. Don't detach the volumes. It is not required.
  end

  def used_devices_in_provider
    values = provider.volumes
    values = values.is_a?(Hash) ? values : {}
    values.collect { |_k, v| v['device'] } || []
  end

  def used_devices_in_volumes
    values = resource.volumes
    values = values.is_a?(Hash) ? values : {}
    values.collect { |_k, v| v['device'] } || []
  end

  def used_devices_in_attached_volumes
    values = resource.attached_volumes
    values = values.is_a?(Hash) ? values : {}
    values.collect { |_k, v| v['device'] } || []
  end

  def used_devices_in_detached_volumes
    values = resource.detached_volumes
    values = values.is_a?(Hash) ? values : {}
    values.collect { |_k, v| v['device'] } || []
  end

  def used_devices
    value = used_devices_in_provider +
            used_devices_in_volumes +
            used_devices_in_attached_volumes -
            used_devices_in_detached_volumes
    value.compact.uniq.sort
  end

  def next_available_device(device)
    letter = device.nil? ? 'b' : device[-1, 1].next
    "/dev/oracleoci/oraclevd#{letter}"
  end

  # rubocop: disable Metrics/AbcSize
  def before_apply
    #
    # Fill in missing device names
    #
    next_device = next_available_device(used_devices&.last)
    resource.oci_api_data[:volumes]&.each do |volume, properties|
      next unless properties['device'].nil?

      Puppet.debug "Using next device '#{next_device}' for volume '#{volume}'."
      properties['device'] = next_device
      next_device = next_available_device(next_device)
    end
    resource.oci_api_data[:attached_volumes]&.each do |volume, properties|
      next unless properties['device'].nil?

      Puppet.debug "Using next device '#{next_device}' for volume '#{volume}'."
      properties['device'] = next_device
      next_device = next_available_device(next_device)
    end
  end
  # rubocop: enable Metrics/AbcSize

  def self.translate_to_resource(_raw_resource, _resource)
    nil
  end

  def current_value
    value = provider.volumes.to_hash
    value == :absent ? {} : value
  end

  def updated_records
    should.only_change_diff(current_value).select { |_k, v| v.is_a?(Hash) && !v.empty? }.keys
  end

  def removed_records
    []
  end

  def added_records
    value.keys - current_records
  end

  def resource_type
    :volume
  end

  # rubocop: disable Naming/MethodParameterName
  def insync?(_is)
    should.all? { |k, _v| current_value.keys.include?(k) }
  end
  # rubocop: enable Naming/MethodParameterName

  association :volume_attachment => { :from => :instance_id, :to => :volume_id, :model => OCI::Core::Models::AttachVolumeDetails, :remove => :detach_volume, :add => :attach_volume }
end

child_of(:volume) { attached_volumes&.collect { |v| "#{tenant_string}/#{v}" } }
