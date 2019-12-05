# frozen_string_literal: true

#
# See the file "LICENSE" for the full license governing this code.
#
require 'puppet_x/enterprisemodules/oci/core'

type_name = File.basename(__FILE__, '.rb').to_sym

Puppet::Type.newtype(type_name) do
  include EasyType::YamlType

  config_file '/etc/oci_tenant.yaml'

  desc <<-DESC
  DESC

  parameter :name

  property :fingerprint
  property :private_key
  property :private_key_password
  property :region
  property :tenancy_ocid
  property :user_ocid
end
