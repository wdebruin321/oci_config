# frozen_string_literal: true

#
# See the file "LICENSE" for the full license governing this code.
#
newproperty(:proxy_address) do
  include EasyType::YamlProperty

  desc <<-DESC
  Address (fqdn) of the proxy server.

  DESC

  data_type('Optional[String]')
end
