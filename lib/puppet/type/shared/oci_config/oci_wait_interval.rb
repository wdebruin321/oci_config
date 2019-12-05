# frozen_string_literal: true

#
# See the file "LICENSE" for the full license governing this code.
#
newparam(:oci_wait_interval) do
  include EasyType

  desc <<-DESC
  The interval beween calls to OCI to check if a resource is in the ready state.
  DESC

  data_type('Integer')

  defaultto 10
end
