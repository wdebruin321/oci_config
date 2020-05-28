# frozen_string_literal: true

#
# See the file "LICENSE" for the full license governing this code.
#
newproperty(:max_elapsed_time_millis) do
  include EasyType::YamlProperty

  desc <<-DESC
  The maximum amount of time (in milliseconds) that can elapse for all attempts before we stop trying 
  to make calls and declare a timeout or that we have no rights to access the resource.

  ** WARNING **

  Be very carefull when specifying these values. In general the provided defaults work well. Changes
  to these values may have dramtic effects.

  DESC

  data_type('Optional[Integer]')
end
