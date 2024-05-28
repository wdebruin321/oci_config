# frozen_string_literal: true

#
# See the file "LICENSE" for the full license governing this code.
#
newproperty(:boot_volumes, :array_matching => :all, :parent => Puppet_X::EnterpriseModules::Oci::AssociatedHashProperty) do
  desc ''
  data_type('Hash[String[1], Any]')

  def before_destroy
    # Nothing. Don't destroy the boot volumes. Let OCI handle this
  end

  association :boot_volume_attachment =>
    { :from => :instance_id, :to => :boot_volume_id, :model => OCI::Core::Models::AttachBootVolumeDetails, :remove => :detach_boot_volume, :add => :attach_boot_volume }
end
