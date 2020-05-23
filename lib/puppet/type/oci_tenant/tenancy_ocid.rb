# frozen_string_literal: true

#
# See the file "LICENSE" for the full license governing this code.
#
newproperty(:tenancy_ocid) do
  include EasyType::YamlProperty

  desc <<-DESC
  OCID of the tenancy to use for authentication.
  DESC

  data_type('Optional[String[1]]')
end
