require_relative '../spec_helper_acceptance'
require_relative '../support/shared_acceptance_specs'
# rubocop: disable Style/AlignParameters

describe 'oci_core_route_table' do
  include_context 'setup'
  test_name = unique_test_name

  let(:resource_name) { "acceptance_tests/test_route_table_#{test_name}" }

  before(:all) do
    manifest = <<-EOD
      oci_core_vcn { 'enterprisemodules (root)/acceptance_tests/vcn_#{test_name}':
        ensure     => 'present',
        cidr_block => '10.0.0.0/16',
      }

      oci_core_internet_gateway { 'enterprisemodules (root)/acceptance_tests/test_ig_#{test_name}':
        ensure     => 'present',
        vcn        => 'acceptance_tests/vcn_#{test_name}',
        is_enabled => true,
      }

    EOD
    apply_manifest(manifest, :expect_changes => true)
  end

  after(:all) do
    manifest = <<-EOD
      oci_core_internet_gateway { 'enterprisemodules (root)/acceptance_tests/test_ig_#{test_name}':
        ensure => 'absent',
      }

      -> oci_core_vcn { 'enterprisemodules (root)/acceptance_tests/vcn_#{test_name}':
        ensure => 'absent',
      }
    EOD
    apply_manifest(manifest, :expect_changes => true)
  end


  context 'route table does not exists' do
    it 'should add the route table idempotent' do
      manifest = <<-EOD
        oci_core_route_table { 'enterprisemodules (root)/#{resource_name}':
          ensure      => 'present',
          vcn         => 'acceptance_tests/vcn_#{test_name}',
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
      EOD
      apply_manifest(manifest, :expect_changes => true)
      apply_manifest(manifest, :catch_changes => true)
    end
  end

  context "route table exists" do
    it "should change the route table idempotent" do
      manifest = <<-EOD
        oci_core_route_table { 'enterprisemodules (root)/#{resource_name}':
          ensure        => 'present',
          vcn           => 'acceptance_tests/vcn_#{test_name}',
          route_rules   => [],
        }
      EOD
      apply_manifest(manifest, :expect_changes => true)
      apply_manifest(manifest, :catch_changes => true)
    end

    it "should remove the route table idempotent" do
      manifest = <<-EOD
        oci_core_route_table { 'enterprisemodules (root)/#{resource_name}':
          ensure        => 'absent',
          absent_states => ['TERMINATED'], # Really wait unit it is gone so we can remove the setup too
        }
      EOD
      apply_manifest(manifest, :expect_changes => true)
      apply_manifest(manifest, :catch_changes => true)
    end
  end
end
