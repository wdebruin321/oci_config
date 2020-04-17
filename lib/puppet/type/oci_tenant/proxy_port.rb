# frozen_string_literal: true

#
# See the file "LICENSE" for the full license governing this code.
#
newproperty(:proxy_port) do
  include EasyType::YamlProperty

  desc <<-DESC
  IP port of the proxy server.

  DESC

  data_type('Optional[Integer]')
end
