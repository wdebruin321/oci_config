# frozen_string_literal: true

#
# Dir.home is used in the sdk, but will fail when run as a service. That's
# why we monley patch our own implementation here that will NOT fail when run as
# a service. We patch it before requiring oci, because it is used in constants
#
class Dir
  def self.home
    Etc.getpwuid(Process.uid).dir
  end
end

require 'pathname'
require 'etc'
$LOAD_PATH.unshift(Pathname.new(__FILE__).dirname.parent.parent)
$LOAD_PATH.unshift(Pathname.new(__FILE__).dirname.parent.parent.parent.parent + 'easy_type' + 'lib')

begin
  require 'oci'
rescue LoadError
  raise Puppet::Error, 'oci gem is not installed. Please install this gem before using oci_ puppet resources.'
end
require 'easy_type'
require_relative './settings'
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

module OCI
  # The base API client which contains functionality make requests and receive responses from OCI
  # services. This client also handles request serialization and response deserialization
  #
  # We would like a client without paging. So we override the basic functionality of the web client class
  # to do multiple calls and only return when all data is available.
  #
  class ApiClient
    # rubocop: disable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/MethodLength, Metrics/PerceivedComplexity
    def call_api(http_method, path, endpoint, opts, &block)
      http_method = http_method.to_sym.downcase

      if http_method != :get
        return call_api_inner(http_method, path, endpoint, opts, &block) unless using_instance_principals?

        return instance_principals_signer_wrapped_call do
          call_api_inner(http_method, path, endpoint, opts, &block)
        end
      end

      # Wrap get calls in a lambda that can be called later for paging
      # and wait_until.
      proc = lambda { |page|
        unless page.nil?
          opts[:query_params] ||= {}
          opts[:query_params][:page] = page
          opts[:query_params][:start] = page if opts[:return_type] == 'OCI::ObjectStorage::Models::ListObjects'
        end

        return call_api_inner(http_method, path, endpoint, opts, &block)
      }

      next_page = nil
      agregated_data = []
      agregated = false
      # rubocop: disable Lint/LiteralAsCondition
      while true
        response = proc.call(next_page) unless using_instance_principals?
        response = instance_principals_signer_wrapped_call { proc.call(next_page) } if using_instance_principals?
        break unless response.data.is_a?(Array)

        agregated_data += response.data
        break if response.next_page.nil?

        agregated = true
        next_page = response.next_page
      end
      # rubocop: enable Lint/LiteralAsCondition
      if agregated
        #
        # Build a new response if we have agregated data
        #
        response = Response.new(response.status, response.headers, agregated_data)
      end
      response.api_call = proc
      response
    end
    # rubocop: enable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/MethodLength, Metrics/PerceivedComplexity
  end
end
