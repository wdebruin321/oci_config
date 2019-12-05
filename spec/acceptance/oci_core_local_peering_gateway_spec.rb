require_relative '../spec_helper_acceptance'
require_relative '../support/shared_acceptance_specs'
# rubocop: disable Style/AlignParameters

describe 'oci_core_local_peering_gateway' do
  include_context 'setup'
  test_name = unique_test_name

  let(:resource_name) { "acceptance_tests/test_local_peering_gateway_#{test_name}" }

  before(:all) do
    manifest = <<-EOD
      oci_core_vcn { 'enterprisemodules (root)/acceptance_tests/vcn_#{test_name}':
        ensure     => 'present',
        cidr_block => '10.0.0.0/16',
      }

      oci_core_route_table { ['enterprisemodules (root)/acceptance_tests/test_route_table_#{test_name}_1', 'enterprisemodules (root)/acceptance_tests/test_route_table_#{test_name}_2']:
        ensure        => 'present',
        vcn           => 'acceptance_tests/vcn_#{test_name}',
        route_rules   => [],
      }

    EOD
    apply_manifest(manifest, :expect_changes => true)
  end

  after(:all) do
    manifest = <<-EOD
      oci_core_route_table { ['enterprisemodules (root)/acceptance_tests/test_route_table_#{test_name}_1', 'enterprisemodules (root)/acceptance_tests/test_route_table_#{test_name}_2']:
        ensure => 'absent',
      } ->
      oci_core_vcn { 'enterprisemodules (root)/acceptance_tests/vcn_#{test_name}':
        ensure => 'absent',
      }
    EOD
    apply_manifest(manifest, :expect_changes => true)
  end


  context 'local peering gateway does not exists' do
    it 'should add the local peering gateway idempotent' do
      manifest = <<-EOD
        oci_core_local_peering_gateway { 'enterprisemodules (root)/#{resource_name}':
          ensure      => 'present',
          vcn         => 'acceptance_tests/vcn_#{test_name}',
          route_table => 'acceptance_tests/test_route_table_#{test_name}_1',
        }
      EOD
      apply_manifest(manifest, :expect_changes => true)
      apply_manifest(manifest, :catch_changes => true)
    end
  end

  context "local peering gateway exists" do
    it "should change the local peering gateway idempotent" do
      manifest = <<-EOD
        oci_core_local_peering_gateway { 'enterprisemodules (root)/#{resource_name}':
            ensure      => 'present',
            vcn         => 'acceptance_tests/vcn_#{test_name}',
            route_table => 'acceptance_tests/test_route_table_#{test_name}_2',
          }
      EOD
      apply_manifest(manifest, :expect_changes => true)
      apply_manifest(manifest, :catch_changes => true)
    end

    it "should remove the local peering gateway idempotent" do
      manifest = <<-EOD
        oci_core_local_peering_gateway { 'enterprisemodules (root)/#{resource_name}':
          ensure => 'absent',
        }
      EOD
      apply_manifest(manifest, :expect_changes => true)
      apply_manifest(manifest, :catch_changes => true)
    end
  end
end
