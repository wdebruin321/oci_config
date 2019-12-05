require_relative '../spec_helper_acceptance'
require_relative '../support/shared_acceptance_specs'
# rubocop: disable Style/AlignParameters

describe 'oci_core_security_list' do
  include_context 'setup'
  test_name = unique_test_name

  let(:resource_name) { "acceptance_tests/test_security_list_#{test_name}" }

  before(:all) do
    manifest = <<-EOD
      oci_core_vcn { 'enterprisemodules (root)/acceptance_tests/vcn_#{test_name}':
        ensure     => 'present',
        cidr_block => '10.0.0.0/16',
      }
    EOD
    apply_manifest(manifest, :expect_changes => true)
  end

  after(:all) do
    manifest = <<-EOD
      oci_core_vcn { 'enterprisemodules (root)/acceptance_tests/vcn_#{test_name}':
        ensure => 'absent',
      }
    EOD
    apply_manifest(manifest, :expect_changes => true)
  end


  context 'security list does not exists' do
    it 'should add the security list idempotent' do
      manifest = <<-EOD
        oci_core_security_list { 'enterprisemodules (root)/#{resource_name}':
          ensure                 => 'present',
          vcn                    => 'acceptance_tests/vcn_#{test_name}',
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
                'max' => 22,
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
      apply_manifest(manifest, :catch_changes => true)
    end
  end

  context "security list exists" do
    it "should change the security list idempotent" do
      manifest = <<-EOD
        oci_core_security_list { 'enterprisemodules (root)/#{resource_name}':
          ensure                 => 'present',
          vcn                    => 'acceptance_tests/vcn_#{test_name}',
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
      apply_manifest(manifest, :catch_changes => true)
    end

    it "should remove the security list idempotent" do
      manifest = <<-EOD
        oci_core_security_list { 'enterprisemodules (root)/#{resource_name}':
          ensure => 'absent',
        }
      EOD
      apply_manifest(manifest, :expect_changes => true)
      apply_manifest(manifest, :catch_changes => true)
    end
  end
end
