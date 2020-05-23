# frozen_string_literal: true

#
# See the file "LICENSE" for the full license governing this code.
#
newproperty(:region) do
  include EasyType::YamlProperty

  desc <<-DESC
  A region to use for APIs created with this instance.
  DESC

  data_type('Optional[String[1]]')
end
