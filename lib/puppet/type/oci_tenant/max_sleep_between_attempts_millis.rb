# frozen_string_literal: true

#
# See the file "LICENSE" for the full license governing this code.
#
newproperty(:max_sleep_between_attempts_millis) do
  include EasyType::YamlProperty

  desc <<-DESC
  For exponential backoff and retry calclulation, the maximum amount of time (in milliseconds) to
  sleep between attempts.

  ** WARNING **

  Be very carefull when specifying these values. In general the provided defaults work well. Changes
  to these values may have dramtic effects.
  DESC

  data_type('Optional[Integer]')
end
