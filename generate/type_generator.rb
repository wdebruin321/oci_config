# frozen_string_literal: true

require 'erb'
require 'active_support/core_ext/string'
require 'yaml'

# Documentation
class TypeGenerator
  DATA_FILE = './generate/types.yaml'

  def initialize
    @data = YAML.load_file(DATA_FILE)
  end

  def generate
    @data.each do |type, data|
      generate_type_for(type, data)
    end
  end

  def generate_type_for(type, data)
    puts "Generating type and provider for '#{type}'..."
    generate_type(type, data)
    generate_properties(type, data)
    generate_provider(type, data)
  end

  def generate_type(type, data)
    object_type = @data[type]['klass'].split('::').last.underscore
    FileUtils.mkdir_p("./lib/puppet/type/#{type}")
    write_template('type.rb.erb', "./lib/puppet/type/#{type}.rb", binding)
  end

  def generate_provider(type, data)
    FileUtils.mkdir_p("./lib/puppet/provider/#{type}")
    write_template('sdk.rb.erb', "./lib/puppet/provider/#{type}/sdk.rb", binding)
    write_template('identity.rb.erb', "./lib/puppet/provider/#{type}/.identity.rb", binding)
  end

  # rubocop: disable Metrics/AbcSize
  def generate_properties(type, _data)
    @data[type]['properties'].each do |property|
      name = property.first
      next if %w[name display_name compartment id compartment_id].include?(name) # Skip certain attributes

      next if property[1]['custom']

      `rm -f lib/puppet/type/#{type}/#{name}.rb` if property[1]['deprecated']
      next if property[1]['deprecated']

      generate_property(type, name, binding)
      if name =~ /_id$/
        referenced_property = name[0...-3]
        generate_reference_property(type, referenced_property, binding)
        generate_referenced_property(type, name, binding)
      elsif name =~ /_ids$/
        referenced_property = name[0...-4] + 's'
        generate_reference_array_property(type, referenced_property, binding)
        generate_referenced_array_property(type, name, binding)
      else
        generate_property(type, name, binding)
      end
    end
    generate_name_parameter(type, "#{type}_name")
  end
  # rubocop: enable Metrics/AbcSize

  def reference_properties(type)
    @data[type]['properties'].keys.grep(/_ids?$/)
  end

  def generate_property(type, name, binding)
    write_template('property.rb.erb', "./lib/puppet/type/#{type}/#{name}.rb", binding)
  end

  def generate_reference_property(type, name, binding)
    write_template('reference_property.rb.erb', "./lib/puppet/type/#{type}/#{name}.rb", binding)
  end

  def generate_reference_array_property(type, name, binding)
    write_template('reference_array_property.rb.erb', "./lib/puppet/type/#{type}/#{name}.rb", binding)
  end

  def generate_referenced_property(type, name, binding)
    write_template('referenced_property.rb.erb', "./lib/puppet/type/#{type}/#{name}.rb", binding)
  end

  def generate_referenced_array_property(type, name, binding)
    write_template('referenced_array_property.rb.erb', "./lib/puppet/type/#{type}/#{name}.rb", binding)
  end

  def generate_name_parameter(type, name)
    object_type = @data[type]['klass'].split('::').last.underscore
    write_template('name_parameter.rb.erb', "./lib/puppet/type/#{type}/#{object_type}_name.rb", binding)
  end

  def write_template(template_name, output, binding)
    template = ERB.new(File.read("./generate/templates/#{template_name}"), nil, '-')
    content = template.result(binding)
    File.write(output, content)
  end
end
