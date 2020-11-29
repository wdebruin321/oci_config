# frozen_string_literal: true

#
# See the file "LICENSE" for the full license governing this code.
#
newparam(:augment_metadata) do
  include EasyType

  desc <<-DESC
    When this parameter is set, Puppet will augment the metadata with OCI
    information that is only available on OCI. Here is the information that#{' '}
    will be available in the metadata:

      - compartment name
      - full OCI name
#{'  '}
    The default for the parameter is `true`. If you want to disable it, you have to set it
    explicitly.

  DESC

  isnamevar

  data_type('Boolean')
  defaultto true
end
