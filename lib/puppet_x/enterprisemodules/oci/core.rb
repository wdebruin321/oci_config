# frozen_string_literal: true

begin
  require 'oci'
rescue LoadError
  raise Puppet::Error, 'oci gem is not installed. Please install this gem before using oci_ puppet resources.'
end

require 'pathname'
$LOAD_PATH.unshift(Pathname.new(__FILE__).dirname.parent.parent)
$LOAD_PATH.unshift(Pathname.new(__FILE__).dirname.parent.parent.parent.parent + 'easy_type' + 'lib')
require 'easy_type'
require_relative '../settings'
require_relative './type'
require_relative './property'
require_relative './config'
require_relative './name_resolver'
require_relative './resource_lister'
require_relative './model_additions'
require_relative './service_info'
require_relative './associated_property'
require_relative './associated_array_property'
require_relative './associated_hash_property'
#
# Require the ones missing in core.rb from the gem.
#
begin
  require 'oci/core/models/create_volume_backup_policy_details'
rescue LoadError
  # This version of the Gem doesn't have the volume backup policy.
end

#
# Add underscore method to String. Method borrowed from Rails
#
class String
  def underscore
    gsub(/::/, '/').
      gsub(/([A-Z]+)([A-Z][a-z])/, '\1_\2').
      gsub(/([a-z\d])([A-Z])/, '\1_\2').
      tr('-', '_').
      downcase
  end

  def downcase_first_letter
    self[0].downcase + self[1..-1]
  end
end

# Add some methods from Rails to aid in changeing keys
class Hash
  def to_puppet
    #
    # The keys sometimes use Gbs and Mbs, we don't want to underscore this.
    # So we first  make these lowercase.
    #
    deep_transform_keys { |key| key.to_s.gsub('GBs', 'Gbs').gsub('MBs', 'Mbs').underscore }
  end

  def to_oci
    #
    # The keys sometimes use Gbs and Mbs, we don't want to underscore this.
    # So we first  make these lowercase.
    #
    deep_transform_keys { |key| key.to_s.gsub('_gbs', '_g_bs').gsub('_mbs', '_m_bs').split('_').collect(&:capitalize).join.downcase_first_letter }
  end

  def _deep_transform_keys_in_object(object, &block)
    case object
    when Hash
      object.each_with_object({}) do |(key, value), result|
        result[yield(key)] = _deep_transform_keys_in_object(value, &block)
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

  # rubocop: disable Metrics/AbcSize
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

  # rubocop: enable Metrics/AbcSize
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
