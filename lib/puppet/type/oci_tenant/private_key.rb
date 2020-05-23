# frozen_string_literal: true

#
# See the file "LICENSE" for the full license governing this code.
#
newproperty(:private_key) do
  include EasyType::EncryptedYamlProperty

  desc <<-DESC
  Client private key content.

  DESC

  data_type('Optional[String[1]]')
end
