# frozen_string_literal: true

#
# See the file "LICENSE" for the full license governing this code.
#
require 'net/http'
require 'json'
require_relative '../puppet_x/enterprisemodules/oci/monkey_patches/hash'
require_relative '../puppet_x/enterprisemodules/oci/monkey_patches/string'

def instance_path
  '/opc/v1/instance/'
end

def vnic_path
  '/opc/v1/vnics/'
end

def get_data(path)
  response = Net::HTTP.start('169.254.169.254', 80, :read_timeout => 0.5, :open_timeout => 0.5) do |http|
    http.read_timeout = 0.5
    http.get(path)
  end
  json_data = response.body
  begin
    data = JSON.parse(json_data)
    convert_keys(data)
  rescue JSON::ParserError
    nil
  end
end

def convert_keys(value)
  case value
  when Array
    value.map { |v| convert_keys(v) }
  when Hash
    value.to_puppet
  else
    value
  end
end

def oci_try
  value = yield
  Puppet.debug 'oci metadata fetched successfully.'
  value
rescue StandardError
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
  confine :oci_instance do |oci_instance|
    !oci_instance.nil?
  end

  oci_instance = Facter.value(:oci_instance)
  setcode do
    oci_instance['id']
  end
end

Facter.add(:oci_defined_tags) do
  confine :oci_instance do |oci_instance|
    !oci_instance.nil?
  end

  oci_instance = Facter.value(:oci_instance)
  setcode do
    oci_instance['defined_tags']
  end
end

Facter.add(:oci_freeform_tags) do
  confine :oci_instance do |oci_instance|
    !oci_instance.nil?
  end

  oci_instance = Facter.value(:oci_instance)
  setcode do
    oci_instance['freeform_tags']
  end
end

Facter.add(:oci_ocpus) do
  confine :oci_instance do |oci_instance|
    !oci_instance.nil?
  end

  setcode do
    begin
      require 'oci'

      signer = OCI::Auth::Signers::InstancePrincipalsSecurityTokenSigner.new
      compute_client = OCI::Core::ComputeClient.new(signer: signer)

      instance_id = Facter.value(:oci_instance)['id']
      instance = compute_client.get_instance(instance_id).data
      instance.shape_config.ocpus
    rescue => e
      Facter.debug("Failed to get ocpus: #{e}")
      nil
    end
  end
end