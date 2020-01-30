# frozen_string_literal: true

#
# See the file "LICENSE" for the full license governing this code.
#
newproperty(:volumes, :parent => Puppet_X::EnterpriseModules::Oci::AssociatedHashProperty) do
  desc <<-DESC
    The volumes connected to the instance. Here is an example on how to use this:

        oci_core_instance { 'tenant (root)/my_instance':
          ensure              => 'present',
            .
            .
          volumes             => {
            'compartment_name/my_volume_1' => {
              'attachment_type' => 'paravirtualized',
              'device'          => '/dev/oracleoci/oraclevdb',
              'display_name'    => 'data_disk_1',
              'is_read_only'    => false,
            },
            'compartment_name/my_volume_2' => {
              'attachment_type' => 'paravirtualized',
              'device'          => '/dev/oracleoci/oraclevdc',
              'display_name'    => 'data_disk_2',
              'is_read_only'    => false,
            }
          }
        }

  DESC
  data_type('Hash[String[1], Any]')

  def before_destroy
    # Do nothing. Don't detacht the volumes. It is not required.
  end

  # rubocop: disable Naming/MethodParameterName
  def insync?(is)
    # If any disks are added or removed, we are not in sync.
    return false if is.keys.sort != should.keys.sort

    super
  end
  # rubocop: enable Naming/MethodParameterName

  association :volume_attachment => { :from => :instance_id, :to => :volume_id, :model => OCI::Core::Models::AttachVolumeDetails, :remove => :detach_volume, :add => :attach_volume }
end

child_of(:volume) { volumes&.collect { |v| "#{tenant_string}/#{v}" } }
