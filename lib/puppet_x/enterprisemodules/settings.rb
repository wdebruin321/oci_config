# frozen_string_literal: true

#
# See the file "LICENSE" for the full license governing this code.
#
module Puppet_X
  module EnterpriseModules
    # Add Documentation
    module Settings
      def self.included(parent)
        parent.extend(Settings)
      end

      def setting_for(key)
        settings[key]
      end

      def configuration
        @configuration ||= read_from_yaml
      end

      def settings
        configuration[environment]
      end

      def read_from_yaml
        # rubocop:disable Security/YAMLLoad,Security/Open
        if File.exist?(settings_file)
          open(settings_file) { |f| YAML.load(f) }
        else
          Hash['default', {}]
        end
        # rubocop:enable Security/YAMLLoad,Security/Open
      end

      def settings_file
        Pathname.new(SETTINGS_FILE).expand_path
      end
    end
  end
end
