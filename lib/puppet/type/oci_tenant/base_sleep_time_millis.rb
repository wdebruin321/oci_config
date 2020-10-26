# frozen_string_literal: true

#
# See the file "LICENSE" for the full license governing this code.
#
newproperty(:base_sleep_time_millis) do
  include EasyType::YamlProperty

  desc <<-DESC
    The time to sleep between the OCI call attempts.

    ** WARNING **

    Be very carefull when specifying these values. In general the provided defaults work well. Changes
    to these values may have dramtic effects.
  DESC

  data_type('Optional[Integer]')
end
