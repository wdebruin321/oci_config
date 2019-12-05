# frozen_string_literal: true

#
# See the file "LICENSE" for the full license governing this code.
#
newproperty(:private_key_password) do
  include EasyType::EncryptedYamlProperty

  desc <<-DESC
  Pass phrase used for key file, if it is encrypted.

  DESC

  data_type('Optional[String[1]]')
end
