# frozen_string_literal: true

#
# See the file "LICENSE" for the full license governing this code.
#
newparam(:tenant) do
  include EasyType
  include EasyType::Validators::Name

  desc <<-DESC
  The tenant for this resource.
  DESC

  isnamevar

  data_type('String[1]')
end
