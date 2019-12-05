# frozen_string_literal: true

#
# See the file "LICENSE" for the full license governing this code.
#
newparam(:synchronized) do
  include EasyType

  desc <<-DESC
  Specifies if Puppet waits for OCI actions to be ready before moving on to an other resource.
  DESC

  data_type('Boolean')

  defaultto true
end
