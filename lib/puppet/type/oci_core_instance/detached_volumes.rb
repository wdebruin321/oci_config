# frozen_string_literal: true

#
# See the file "LICENSE" for the full license governing this code.
#
newproperty(:detached_volumes, :parent => Puppet_X::EnterpriseModules::Oci::AssociatedHashProperty) do
  desc <<-DESC
    The volumes your want ensure are detached from  the instance. This is different from the
    regular `volumes` property in the sense that this is only about the specified
    volumes. It doesn't care about any other volumes attached. It doesn't describe the
    the full state, but only the partial state of this volume.

    Here is an example on how to use this:

        oci_core_instance { 'tenant (root)/my_instance':
          ensure              => 'present',
            .
            .
          detached_volumes             => {
            'compartment_name/my_volume_1' => {}
          }
        }

    The empty hash is required. This is to keep this property the same as all other
    volume related properties. Any other information in there will be disregarded

  DESC
  data_type('Optional[Hash[String[1], Any]]')

  def before_destroy
    # Do nothing. Don't detach the volumes. It is not required.
  end

  def self.translate_to_resource(_raw_resource, _resource)
    nil
  end

  def current_value
    value = provider.volumes.to_hash
    value == :absent ? {} : value
  end

  def updated_records
    []
  end

  def removed_records
    value.keys.select { |k| current_value.keys.include?(k) }
  end

  def added_records
    []
  end

  def resource_type
    :volume
  end

  # rubocop: disable Naming/MethodParameterName
  def insync?(_is)
    should.all? { |k, _v| !current_value.keys.include?(k) }
  end
  # rubocop: enable Naming/MethodParameterName

  association :volume_attachment => { :from => :instance_id, :to => :volume_id, :model => OCI::Core::Models::AttachVolumeDetails, :remove => :detach_volume, :add => :attach_volume }
end

child_of(:volume) { detached_volumes&.collect { |v| "#{tenant_string}/#{v}" } }
