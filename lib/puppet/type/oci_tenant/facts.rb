# frozen_string_literal: true

#
# See the file "LICENSE" for the full license governing this code.
#
newproperty(:facts, :array_matching => :all) do
  include EasyType::YamlProperty

  desc <<-DESC
  The facts you want to enable on this tennant.

  DESC

  data_type('Array[String[1]]')
  defaultto []
end
