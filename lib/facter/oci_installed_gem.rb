# frozen_string_literal: true

#
# See the file "LICENSE" for the full license governing this code.
#
#
# Get the version of the installed OCI gem
#
Facter.add(:oci_installed_gem) do
  confine :kernel => 'Linux'

  setcode do
    gem_version = Facter::Util::Resolution.exec('/opt/puppetlabs/puppet/bin/gem list oci --local | grep oci')
    if gem_version == ''
      'none'
    else
      gem_version.scan(/\((.*)\)/)[0][0]
    end
  end
end
