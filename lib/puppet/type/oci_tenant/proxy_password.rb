# frozen_string_literal: true

#
# See the file "LICENSE" for the full license governing this code.
#
newproperty(:proxy_password) do
  include EasyType::EncryptedYamlProperty

  desc <<-DESC
  Proxy password.

  DESC

  data_type('Optional[String]')
end
