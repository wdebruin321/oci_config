# frozen_string_literal: true

#
# See the file "LICENSE" for the full license governing this code.
#
newparam(:oci_timeout) do
  include EasyType

  desc <<-DESC
  The maximum time to wait for the OCI resource to be in the ready state.
  DESC

  data_type('Integer')

  defaultto 300
end
