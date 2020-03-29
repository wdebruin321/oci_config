# frozen_string_literal: true

require 'net/http'
require 'json'

def instance_path
  '/opc/v1/instance/'
end

def vnic_path
  '/opc/v1/vnics/'
end

def get_data(path)
  response = Net::HTTP.start('169.254.169.254', 80) do |http|
    http.read_timeout = 0.5
    http.get(path)
  end
  json_data = response.body
  begin
    camel_case_data = JSON.parse(json_data)
    convert_hash_keys(camel_case_data)
  rescue JSON::ParserError
    nil
  end
end

def to_snake_case(string)
  string.gsub(/::/, '/').
    gsub(/([A-Z]+)([A-Z][a-z])/, '\1_\2').
    gsub(/([a-z\d])([A-Z])/, '\1_\2').
    tr('-', '_').
    downcase
end

def convert_hash_keys(value)
  case value
  when Array
    value.map { |v| convert_hash_keys(v) }
  # or `value.map(&method(:convert_hash_keys))`
  when Hash
    Hash[value.map { |k, v| [to_snake_case(k), convert_hash_keys(v)] }]
  else
    value
  end
end

def oci_try
  value = yield
  Puppet.debug 'oci metadata fetched successfully.'
  value
rescue Net::ReadTimeout, EOFError
  Puppet.debug 'oci meta data URL not responding. Infering not on OCI.'
  nil
end

def vnic_data
  oci_try { get_data(vnic_path) }
end

def instance_data
  oci_try { get_data(instance_path) }
end

Facter.add(:oci_instance) do
  setcode do
    instance_data
  end
end

Facter.add(:oci_vnics) do
  setcode do
    vnic_data
  end
end

Facter.add(:oci_instance_id) do
  oci_instance = Facter.value(:oci_instance)
  setcode do
    oci_instance['id']
  end
end
