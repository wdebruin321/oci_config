# frozen_string_literal: true

#
# See the file "LICENSE" for the full license governing this code.
#
newproperty(:instance_principal) do
  include EasyType::YamlProperty

  desc <<-DESC
  Authenticate as an instance principal.

  This means for this tenancy, the oci_config module will connect to OCI without any
  of the other authorisation properties and behave like an instance principal.

  Make sure you have given the instance enough rights to do the actions you want it to do.

  DESC

  data_type('Optional[Boolean]')
  defaultto false
end
