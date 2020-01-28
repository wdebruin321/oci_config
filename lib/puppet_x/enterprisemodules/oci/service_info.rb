# frozen_string_literal: true

require 'yaml'

module Puppet_X
  module EnterpriseModules
    module Oci
      # Docs
      class ServiceInfo
        @information = YAML.load_file(File.dirname(File.expand_path(__FILE__)) + '/../../../../data/services.yaml').freeze

        def self.type_to_id(type)
          with_type_entry(type) { |e| e[1] }
        end

        def self.type_to_class(type)
          with_type_entry(type) { |e| Object.const_get(e[2]) }
        end

        def self.type_to_client(type)
          with_type_entry(type) { |e| Object.const_get(e[3]) }
        end

        def self.type_to_primary_key(type)
          with_type_entry(type) { |e| e[4] }
        end

        def self.id_to_class(id)
          with_id_entry(id) { |e| Object.const_get(e[2]) }
        end

        def self.id_to_type(id)
          with_id_entry(id) { |e| e[0] }
        end

        def self.with_type_entry(type)
          entry = @information.find { |e| e[0] == type }
          fail "Internal error: No information found for #{type}" if entry.nil?

          yield entry
        end

        def self.with_id_entry(id)
          entry = @information.find { |e| e[1] == id }
          fail "Internal error: No information found for #{id}" if entry.nil?

          yield entry
        end
      end
    end
  end
end
