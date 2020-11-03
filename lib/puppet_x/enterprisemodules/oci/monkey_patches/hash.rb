# frozen_string_literal: true

# Add some methods from Rails to aid in changeing keys
class Hash
  def to_puppet
    #
    # The keys sometimes use Gbs and Mbs, we don't want to underscore this.
    # So we first  make these lowercase.
    #
    deep_transform_keys do |key|
      key.to_s.
        gsub('GBs', 'Gbs').
        gsub('GBs', 'Gbs').
        underscore
    end
  end

  def to_oci
    #
    # The keys sometimes use Gbs and Mbs, we don't want to underscore this.
    # So we first  make these lowercase.
    #
    deep_transform_keys do |key|
      key.to_s.
        gsub(/_gb/, '_g_b').
        gsub('_gbs', '_g_bs').
        gsub('_mbs', '_m_bs').
        split('_').collect(&:capitalize).join.downcase_first_letter
    end
  end

  def _deep_transform_keys_in_object(object, &block)
    case object
    when Hash
      object.each_with_object({}) do |(key, value), result|
        # We don't want to transform the content of the tags. Leave them as they are
        result[yield(key)] = if [:defined_tags, :freeform_tags, :definedTags, :freeformTags, :metadata, :extended_metadata].include?(key)
                               value
                             else
                               _deep_transform_keys_in_object(value, &block)
                             end
      end
    when Array
      object.map { |e| _deep_transform_keys_in_object(e, &block) }
    else
      object
    end
  end

  def deep_transform_keys(&block)
    _deep_transform_keys_in_object(self, &block)
  end

  def deep_diff(value2)
    value1 = self
    (value1.keys | value2.keys).each_with_object({}) do |key, diff|
      next unless value1[key] != value2[key]

      diff[key] = if value1[key].respond_to?(:deep_diff) && value2[key].respond_to?(:deep_diff)
                    value1[key].deep_diff(value2[key])
                  else
                    [value1[key], value2[key]]
                  end
    end
  end

  def only_change_diff(value2)
    value1 = self
    value1.keys.each_with_object({}) do |key, diff|
      next unless value1[key] != value2[key]

      diff[key] = if value1[key].respond_to?(:only_change_diff) && value2[key].respond_to?(:only_change_diff)
                    value1[key].only_change_diff(value2[key])
                  else
                    [value1[key], value2[key]]
                  end
    end
  end
end
