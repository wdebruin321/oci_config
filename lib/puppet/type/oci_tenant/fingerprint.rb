# frozen_string_literal: true

#
# See the file "LICENSE" for the full license governing this code.
#
newproperty(:fingerprint) do
  include EasyType::YamlProperty

  desc <<-DESC
  SSL Fingerprint to use for authentication.
  DESC

  data_type('Optional[String[1]]')
end
