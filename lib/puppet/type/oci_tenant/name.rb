# frozen_string_literal: true

#
# See the file "LICENSE" for the full license governing this code.
#
newparam(:name) do
  include EasyType

  desc <<-DESC
  The name of the setting.

  DESC

  isnamevar

  to_translate_to_resource do |raw_resource|
    raw_resource[:name]
  end

  data_type('String')
end
