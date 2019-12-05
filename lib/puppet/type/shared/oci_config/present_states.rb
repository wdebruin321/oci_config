# frozen_string_literal: true

#
# See the file "LICENSE" for the full license governing this code.
#
newparam(:present_states) do
  include EasyType

  desc <<-DESC
  The OCI states, pupet will detect as the resource beeing present.
  DESC

  data_type('Array[String[1]]')

  defaultto %w[
    AVAILABLE
    RUNNING
    ACTIVE
    ATTACHED
    ASSIGNED
    UP
  ]
end
