# frozen_string_literal: true

require 'erb'
require 'oci'
require 'active_support/core_ext/string'
require 'yard'

# Documentation
class YamlGenerator
  DATA_FILE = './generate/types.yaml'

  def initialize(module_identifier, type_regexp = '.*')
    YARD::Registry.load!('./generate/yardoc')
    @type_regexp = /#{type_regexp}/
    @data = if File.exist?(DATA_FILE)
              YAML.load_file(DATA_FILE)
            else
              {}
            end
    @module_identifier = module_identifier
  end

  def generate
    types = models_in(@module_identifier)
    types.each do |type|
      next unless type.to_s =~ @type_regexp

      generate_yaml_entry_for(type)
    end
    File.write(DATA_FILE, @data.to_yaml)
  end

  private

  # rubocop:disable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/MethodLength
  def generate_yaml_entry_for(type)
    type_class = @module_identifier.to_s.split('::').last.underscore
    type_name =  "oci_#{type_class}_#{type.to_s.underscore}"
    puts "Fetching type information for #{type_name}"
    klass = "#{@module_identifier}::Models::#{type}"
    #
    # instances don't have a create methode, but use a luanch method. So we need to adjust for that
    #
    create_class = case type_name
                   when 'oci_core_instance'
                     'OCI::Core::Models::LaunchInstanceDetails'
                   when 'oci_core_dhcp_options'
                     'OCI::Core::Models::CreateDhcpDetails'
                   else
                     "#{@module_identifier}::Models::Create#{type}Details"
                   end
    @data[type_name] ||= {}
    @data[type_name]['klass'] = klass
    @data[type_name]['properties'] ||= {}
    docs = YARD::Registry.at(klass)
    @data[type_name]['desc'] = docs.docstring.to_s if docs
    all_properties = properties_in(klass).merge(properties_in(create_class))
    all_properties.each do |property, data_type|
      next if property.to_s =~ /_details/

      data_type = translate_data_type(data_type)
      @data[type_name]['properties'][property.to_s] ||= {}
      @data[type_name]['properties'][property.to_s]['data_type'] = data_type.to_s
      docs = YARD::Registry.at("#{create_class}##{property}")
      @data[type_name]['properties'][property.to_s]['desc'] = docs.docstring.to_s.gsub('**[Required]** ', '') if docs
      #
      # If create class doesn't have a description use the one from the main class.
      #
      if @data[type_name]['properties'][property.to_s]['desc'].nil?
        docs = YARD::Registry.at("#{klass}##{property}")
        @data[type_name]['properties'][property.to_s]['desc'] = docs.docstring.to_s.gsub('**[Required]** ', '') if docs
      end
    end
  end
  # rubocop:enable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/MethodLength

  def properties_in(type_class)
    klass = Kernel.const_get(type_class)
    klass.swagger_types
  end

  def models_in(module_identifier)
    module_identifier.const_get('Models').constants.reject { |e| e.to_s =~ /Update|Create|Detail|Summary|Validator/ }
  end

  # rubocop: disable Metrics/AbcSize
  def translate_data_type(data_type)
    case data_type.to_s
    when /OCI::/
      if data_type.to_s =~ /Array<.*>/
        type = data_type.to_s.scan(/Array<(.*)>/).first.first.split('::').last
        output = "Array[Oci_config::#{type}]"
      else
        type = data_type.to_s.split('::').last
        output = "Oci_config::#{type}"
      end
      file_name = "./types/#{type.downcase}.pp"
      File.write(file_name, "# type Oci_Config::#{type} = ") unless File.exist?(file_name)
      output
    when 'BOOLEAN'
      'Boolean'
    when 'DateTime'
      'Runtime'
    else
      data_type.to_s.tr('<', '[').tr('>', ']').gsub('Object', 'Any')
    end
  end
  # rubocop: enable Metrics/AbcSize
end
