# frozen_string_literal: true

#
# See the file "LICENSE" for the full license governing this code.
#
newparam(:absent_states) do
  include EasyType

  desc <<-DESC
  The OCI states, pupet will detect as the resource beeing absent.
  DESC

  data_type('Array[String[1]]')

  defaultto %w[
    TERMINATED
    DETACHED
    STOPPED
    DELETED
    UNASSIGNED
    DOWN
  ]
end
