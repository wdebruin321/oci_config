# frozen_string_literal: true

#
# See the file "LICENSE" for the full license governing this code.
#
require 'net/http'
require 'json'
require 'uri'
require_relative '../puppet_x/enterprisemodules/oci/monkey_patches/hash'
require_relative '../puppet_x/enterprisemodules/oci/monkey_patches/string'

def instance_path
  '/opc/v2/instance/'
end

def vnic_path
  '/opc/v2/vnics/'
end

def add_authorization_header(request)
  request['Authorization'] = "Bearer Oracle"
end

def get_data(path)
  request = Net::HTTP::Get.new(URI("http://169.254.169.254#{path}"))
  add_authorization_header(request)
  response = Net::HTTP.start('169.254.169.254', 80, :read_timeout => 0.5, :open_timeout => 0.5) do |http|
    http.read_timeout = 0.5
    http.get(path)
    http.request(request)
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
    begin
      # Haal metadata op (zoals compartment_id en hostname)
      imds_uri = URI("http://169.254.169.254/opc/v2/instance/")
      imds_req = Net::HTTP::Get.new(imds_uri)
      imds_req['Authorization'] = 'Bearer Oracle'
      imds_res = Net::HTTP.start(imds_uri.hostname, imds_uri.port) { |http| http.request(imds_req) }
      instance_data = JSON.parse(imds_res.body)

      # Token ophalen
      token_uri = URI("http://169.254.169.254/opc/v2/instance/token")
      token_req = Net::HTTP::Get.new(token_uri)
      token_req['Authorization'] = 'Bearer Oracle'
      token_res = Net::HTTP.start(token_uri.hostname, token_uri.port) { |http| http.request(token_req) }
      token_data = JSON.parse(token_res.body)
      security_token = token_data['token']

      # Exadata check
      shape = instance_data['shape']
      if shape && shape.start_with?('Exadata')
        compartment_id = instance_data['compartmentId']
        hostname = instance_data['hostname']

        # Maak REST-call naar OCI API
        region = instance_data['region']
        uri = URI("https://iaas.#{region}.oraclecloud.com/20160918/dbNodes?compartmentId=#{compartment_id}")

        req = Net::HTTP::Get.new(uri)
        req['Authorization'] = "Bearer #{security_token}"
        req['Content-Type'] = 'application/json'

        res = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) { |http| http.request(req) }
        nodes = JSON.parse(res.body)

        node = nodes['items'].find { |n| n['hostname'] == hostname }
        ocpus = node.dig('shapeConfig', 'ocpus') if node

        instance_data['shape_config'] ||= {}
        instance_data['shape_config']['ocpus'] = ocpus if ocpus
      end

      instance_data
    rescue => e
      Facter.debug("Fout bij ophalen via REST API: #{e}")
      {}
    end
  end
end

# Facter.add(:oci_instance) do
#   setcode do
#     data = instance_data

#     if data && data['shape_config']
#       shape = data['shape'] || data['shapeConfig']

#       if shape && shape.start_with?('Exadata')
#         begin
#           Gem.paths = { 'GEM_PATH' => '/usr/share/gems:/opt/puppetlabs/puppet/lib/ruby/gems/2.7.0' }
#           $LOAD_PATH.unshift('/usr/share/gems/gems/oci-2.20.0/lib') unless $LOAD_PATH.include?('/usr/share/gems/gems/oci-2.20.0/lib')
#           require 'oci'
#           Facter.debug("OCI gem geladen")

#           signer = OCI::Auth::Signers::InstancePrincipalsSecurityTokenSigner.new
#           db_client = OCI::Database::DatabaseClient.new(signer: signer)

#           compartment_id = data['compartment_id'] || data['compartmentId']
#           hostname = data['hostname']
#           Facter.debug("Compartment ID gebruikt: #{compartment_id}")
#           Facter.debug("Hostname: #{hostname}")

#           db_nodes = db_client.list_db_nodes(compartment_id: compartment_id).data
#           node = db_nodes.find { |n| n.hostname == hostname }

#           if node && node.shape_config
#             ocpus = node.shape_config.ocpus
#             data['shape_config']['ocpus'] = ocpus
#             Facter.debug("Exadata OCPUs overschreven naar: #{ocpus}")
#           else
#             Facter.debug("Geen matching db-node gevonden voor hostname: #{hostname}")
#           end
#         rescue LoadError => le
#           Facter.debug("Kon OCI gem niet laden: #{le}")
#         rescue => e
#           Facter.debug("Fout bij ophalen Exadata shape config: #{e}")
#         end
#       else
#         Facter.debug("Geen Exadata shape. OCPUs blijven zoals in IMDS.")
#       end
#     end

#     data
#   end
# end

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
