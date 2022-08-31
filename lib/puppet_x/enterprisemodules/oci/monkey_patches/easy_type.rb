#
# See the file "LICENSE" for the full license governing this code.
#
# frozen_string_literal: true

require 'easy_type'

# rubocop: disable Style/Documentation
module EasyType
  module ExtendedParameter
    def self.included(parent)
      parent.extend(ClassMethods)
    end

    module ClassMethods
      #
      # Basic implementation for coercing a value to the correct type.
      #
      def coerce(value)
        return value unless data_type && Puppet.const_defined?(:ResourceApi)

        # Get inside element type for the array ones when the elements are
        # checked one by one
        element_type = if array_data_type? && value && value_not_array?(value)
                         element_type_string = data_type.to_s.scan(/Array\[(.*)\]/).dig(0, 0)
                         element_type_string.chop! if element_type_string.count('[') < element_type_string.count(']')
                         Puppet::Pops::Types::TypeParser.singleton.parse(element_type_string)
                       else
                         data_type
                       end
        # Get resource name from the class
        resource_name = to_s.split('::')[2].downcase

        begin
          value = Puppet::ResourceApi::DataTypeHandling.mungify(
            element_type,
            value,
            "#{resource_name}.#{@name}", # type_name needs to be added for error reporting
            true
          )
          if is_a_boolean_kind?
            # work around https://tickets.puppetlabs.com/browse/PUP-2368
            value ? :true : :false # rubocop:disable Lint/BooleanSymbol
          else
            value
          end
        rescue Puppet::ResourceError => e
          #
          # Because a this point in time pupet does not
          # sync the data types to agents, we can run into issues
          # with missing data types. To bypass this, we just "eat"
          # these error's and let them pass.
          # See issue https://tickets.puppetlabs.com/browse/PUP-7197
          #
          # This means no type checking is done when the types are not available.
          #
          raise unless e.message =~ /references an unresolved type/

          value
        end
      end
    end
  end
end
# rubocop: enable Style/Documentation
