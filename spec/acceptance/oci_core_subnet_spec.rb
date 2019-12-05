require_relative '../spec_helper_acceptance'
require_relative '../support/shared_acceptance_specs'
# rubocop: disable Style/AlignParameters

describe 'oci_core_subnet' do
  include_context 'setup'
  test_name = unique_test_name

  before(:all) do
    manifest = <<-EOD
    oci_core_vcn { 'enterprisemodules (root)/acceptance_tests/vcn_#{test_name}':
      ensure        => 'present',
      cidr_block    => '10.0.0.0/16',
    }

    oci_core_internet_gateway { 'enterprisemodules (root)/acceptance_tests/test_ig_#{test_name}':
      ensure     => 'present',
      vcn        => 'acceptance_tests/vcn_#{test_name}',
      is_enabled => true,
    }

    oci_core_dhcp_options { ['enterprisemodules (root)/acceptance_tests/dhcp_options_#{test_name}_1', 'enterprisemodules (root)/acceptance_tests/dhcp_options_#{test_name}_1']:
      ensure     => 'present',
      vcn        => 'acceptance_tests/vcn_#{test_name}',
      options => [
        {
          'type' => 'DomainNameServer',
          'custom_dns_servers' => [],
          'server_type' => 'VcnLocalPlusInternet'
        },
        {
          'type' => 'SearchDomain',
          'search_domain_names' => ['vcn.oraclevcn.com']
        }
      ],
    }
    oci_core_route_table { ['enterprisemodules (root)/acceptance_tests/route_table_#{test_name}_1', 'enterprisemodules (root)/acceptance_tests/route_table_#{test_name}_2']:
      ensure     => 'present',
      vcn        => 'acceptance_tests/vcn_#{test_name}',
      route_rules => [
        {
          'cidr_block' => '0.0.0.0/0',
          'destination' => '0.0.0.0/0',
          'destination_type' => 'CIDR_BLOCK',
          'network_entity_type' => 'internetgateway',
          'network_entity' => 'acceptance_tests/test_ig_#{test_name}'
        }
      ],
}
    oci_core_security_list { ['enterprisemodules (root)/acceptance_tests/security_list_#{test_name}_1', 'enterprisemodules (root)/acceptance_tests/security_list_#{test_name}_2']:
      ensure     => 'present',
      vcn        => 'acceptance_tests/vcn_#{test_name}',
      egress_security_rules  => [
        {
          'destination' => '0.0.0.0/0',
          'destination_type' => 'CIDR_BLOCK',
          'is_stateless' => false,
          'protocol' => 'all'
        }],
        ingress_security_rules => [
        {
          'is_stateless' => false,
          'protocol' => '6',
          'source' => '0.0.0.0/0',
          'source_type' => 'CIDR_BLOCK',
          'tcp_options' => {
            'destination_port_range' => {
              'max' => 25,
              'min' => 22
            }
          }
        },
        {
          'icmp_options' => {
            'code' => 4,
            'type' => 3
          },
          'is_stateless' => false,
          'protocol' => '1',
          'source' => '0.0.0.0/0',
          'source_type' => 'CIDR_BLOCK'
        },
        {
          'icmp_options' => {
            'type' => 3
          },
          'is_stateless' => false,
          'protocol' => '1',
          'source' => '10.0.0.0/16',
          'source_type' => 'CIDR_BLOCK'
        }],
      }
    EOD
    apply_manifest(manifest, :expect_changes => true)
  end

  after(:all) do
    manifest = <<-EOD
    oci_core_dhcp_options { ['enterprisemodules (root)/acceptance_tests/dhcp_options_#{test_name}_1', 'enterprisemodules (root)/acceptance_tests/dhcp_options_#{test_name}_2']:
      ensure     => 'absent',
    }
    oci_core_route_table { ['enterprisemodules (root)/acceptance_tests/route_table_#{test_name}_1', 'enterprisemodules (root)/acceptance_tests/route_table_#{test_name}_2']:
      ensure     => 'absent',
    }
    oci_core_security_list { ['enterprisemodules (root)/acceptance_tests/security_list_#{test_name}_1', 'enterprisemodules (root)/acceptance_tests/security_list_#{test_name}_2']:
      ensure     => 'absent',
    }
    oci_core_internet_gateway { 'enterprisemodules (root)/acceptance_tests/test_ig_#{test_name}':
      ensure => 'absent',
    }
    oci_core_vcn { 'enterprisemodules (root)/acceptance_tests/vcn_#{test_name}':
      ensure        => 'absent',
    }
    EOD
    apply_manifest(manifest, :expect_changes => true)
  end

  let(:resource_name) { 'acceptance_tests/test_subnet_1' }

  context 'subnet does not exists' do
    it 'should add the subnet idempotent' do
      manifest = <<-EOD
        oci_core_subnet { 'enterprisemodules (root)/#{resource_name}':
          ensure             => 'present',
          cidr_block         => '10.0.0.0/24',
          dhcp_options       => 'acceptance_tests/dhcp_options_#{test_name}_1',
          dns_label          => 'subnet',
          route_table        => 'acceptance_tests/route_table_#{test_name}_1',
          security_lists     => ['acceptance_tests/security_list_#{test_name}_1'],
          subnet_domain_name => 'subnet.vcn.oraclevcn.com',
          vcn                => 'acceptance_tests/vcn_#{test_name}',
          virtual_router_ip  => '10.0.0.1',
          virtual_router_mac => '00:00:17:9B:B0:3F',
        }
      EOD
      apply_manifest(manifest, :expect_changes => true)
      apply_manifest(manifest, :catch_changes => true)
    end
  end

  context "subnet exists" do
    it "should change the subnet idempotent" do
      manifest = <<-EOD
        oci_core_subnet { 'enterprisemodules (root)/#{resource_name}':
          ensure             => 'present',
          cidr_block         => '10.0.0.0/24',
          dhcp_options       => 'acceptance_tests/dhcp_options_#{test_name}_2',
          dns_label          => 'subnet',
          route_table        => 'acceptance_tests/route_table_#{test_name}_2',
          security_lists     => ['acceptance_tests/security_list_#{test_name}_2'],
          subnet_domain_name => 'subnett.vcn.oraclevcn.com',
          vcn                => 'acceptance_tests/vcn_#{test_name}',
          virtual_router_ip  => '10.0.0.2',
          virtual_router_mac => '00:00:17:9B:B0:3F',
        }
      EOD
      apply_manifest(manifest, :expect_changes => true)
      apply_manifest(manifest, :catch_changes => true)
    end

    it "should remove the subnet idempotent" do
      manifest = <<-EOD
        oci_core_subnet { 'enterprisemodules (root)/#{resource_name}':
          ensure => 'absent',
        }
      EOD
      apply_manifest(manifest, :expect_changes => true)
      apply_manifest(manifest, :catch_changes => true)
    end
  end
end
