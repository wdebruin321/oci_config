# frozen_string_literal: true

#
# See the file "LICENSE" for the full license governing this code.
#
#
# Function to fetch the fact ora_is_root_db and based on that information
# decide if the specified sid is a root database or not.
#
Puppet::Functions.create_function('oci_config::latest_image_for') do
  dispatch :latest_image_for do
    param         'String[1]',  :operating_system
    param         'String[1]',  :operating_system_version
    optional_param 'Regexp',    :name
    return_type 'String'
  end

  # rubocop: disable Metrics/AbcSize
  def latest_image_for(operating_system, operating_system_version, name = /.*/)
    variable = 'oci_core_image'
    fail "Fact #{variable} does not exists. Probably not enabled. Check enabled facts for this tenant." unless variable_exists?(variable)

    fact_value = closure_scope.lookupvar("::#{variable}")
    available_images = fact_value.select do |k, v|
      v['operating_system'] == operating_system &&
        v['operating_system_version'] == operating_system_version &&
        k =~ name
    end
    fail "No images found for '#{operating_system} version #{operating_system_version}' with name #{name}" if available_images == {}

    available_images.min_by { |k, _v| k['time_created'] }.first.split('/').last
  end
  # rubocop: enable Metrics/AbcSize

  # Check if the variable exists without generating a warning
  def variable_exists?(var)
    closure_scope.to_hash.keys.include?(var)
  end
end
