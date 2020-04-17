# frozen_string_literal: true

#
# See the file "LICENSE" for the full license governing this code.
#
newproperty(:proxy_user) do
  include EasyType::YamlProperty

  desc <<-DESC
  Username for the proxy.

  DESC

  data_type('Optional[String]')
end
