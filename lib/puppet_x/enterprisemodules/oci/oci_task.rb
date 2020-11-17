#!/opt/puppetlabs/puppet/bin/ruby
# frozen_string_literal: true

#
#
# See the file "LICENSE" for the full license governing this code.
#
#
require 'json'
require 'open3'
require 'puppet'
require 'puppet_x/enterprisemodules/oci/core'

# TODO: Docs
# docs
module Puppet_X
  module EnterpriseModules
    module Oci
      # Docs
      class PuppetTask
        include Puppet_X::EnterpriseModules::Oci::Config
        include Puppet_X::EnterpriseModules::Oci::Settings

        def parameters
          self.class.parameter
        end

        def client_class
          self.class.client
        end

        def oci_info
          self.class.oci_info
        end

        def self.oci_info(parameter = nil)
          if parameter.nil?
            @oci_info
          else
            @oci_info = parameter
          end
        end

        def self.parameter(name = nil, default_value = nil)
          return @parameters if name.nil?

          @parameters ||= {}
          fail "Parameter #{name} already defined." if @parameters.keys.include?(name)

          @parameters[name] = default_value
        end

        def self.client(client_class = nil)
          if client_class.nil?
            @client_class
          else
            @client_class = client_class
          end
        end

        def self.run
          instance = new
          instance.run
        end

        def run
          fetch_input
          execute
        rescue StandardError => e
          @result[:_error] = {
            :msg => e.message,
            :kind => 'enterprisemodules-oci_config/generic'
          }
        ensure
          report
        end

        def fetch_input
          @result = {}
          params = JSON.parse($stdin.read)
          #
          # Fetch defined variables from input
          #
          parameters.each do |parameter, default_value|
            value = params[parameter.to_s] || default_value
            instance_variable_set(:"@#{parameter}", value)
          end
          oci_var = instance_variable_get(:"@#{oci_info}")
          @tenant = if oci_var.nil?
                      default_tenant
                    else
                      text = oci_var.match(/^(.*) \(root\).*$/)
                      text[1] if text
                    end
          fail 'invalid formatted oci_tenant specified.' if @tenant == ''

          @resolver = Puppet_X::EnterpriseModules::Oci::NameResolver.instance(@tenant)
          @client = client_for(client_class, @tenant)
        end

        def report
          puts @result.to_json
        end

        def call_oci
          fail 'Needs to be implemented by sub class.'
        end

        def execute
          @result['data'] = call_oci
        rescue OCI::Errors::ServiceError => e
          @result[:_error] = {
            :msg => e.message,
            :kind => 'enterprisemodules-oci_config/oci_error'
          }
        end
      end
    end
  end
end
