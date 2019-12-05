require_relative '../spec_helper_acceptance'
require_relative '../support/shared_acceptance_specs'
# rubocop: disable Style/AlignParameters

describe 'oci_core_ip_sec_connection' do
  include_context 'setup'
  test_name = unique_test_name

  let(:resource_name) { "acceptance_tests/test_ip_sec_connection_#{test_name}" }

  before(:all) do
    manifest = <<-EOD
      oci_core_cpe { 'enterprisemodules (root)/acceptance_tests/test_cpe_#{test_name}':
        ensure          => 'present',
        ip_address      =>'10.0.0.1',
      }
      oci_core_drg { 'enterprisemodules (root)/acceptance_tests/test_drg_#{test_name}':
        ensure          => 'present',
      }
    EOD
    apply_manifest(manifest, :expect_changes => true)
  end

  after(:all) do
    manifest = <<-EOD
      oci_core_cpe { 'enterprisemodules (root)/acceptance_tests/test_cpe_#{test_name}':
        ensure       => 'absent',
        synchronized => false,
      }
      oci_core_drg { 'enterprisemodules (root)/acceptance_tests/test_drg_#{test_name}':
        ensure       => 'absent',
        synchronized => false,
        }
    EOD
    apply_manifest(manifest, :expect_changes => true)
  end


  context 'ip_sec_connection does not exists' do
    it 'should add the ip_sec_connection idempotent' do
      manifest = <<-EOD
        oci_core_ip_sec_connection { 'enterprisemodules (root)/#{resource_name}':
          ensure        => 'present',
          freeform_tags => {'test' => 'no'},
          drg           => 'acceptance_tests/test_drg_#{test_name}',
          cpe           => 'acceptance_tests/test_cpe_#{test_name}',
          static_routes => ['10.0.0.0/16'],
          oci_timeout   => 1200, # This can take a long time, so we need a longer timeout
        }
      EOD
      apply_manifest(manifest, :expect_changes => true)
      apply_manifest(manifest, :catch_changes => true)
    end
  end

  context "ip_sec_connection exists" do
    it "should change the ip_sec_connection idempotent" do
      manifest = <<-EOD
        oci_core_ip_sec_connection { 'enterprisemodules (root)/#{resource_name}':
          ensure        => 'present',
          freeform_tags => {'test' => 'yes'},
        }
      EOD
      apply_manifest(manifest, :expect_changes => true)
      apply_manifest(manifest, :catch_changes => true)
    end

    it "should remove the ip_sec_connection idempotent" do
      manifest = <<-EOD
        oci_core_ip_sec_connection { 'enterprisemodules (root)/#{resource_name}':
          ensure => 'absent',
          oci_timeout   => 1200, # This can take a long time, so we need a longer timeout
          absent_states => ['TERMINATED'], # Really wait unit it is gone so we can remove the setup too
        }
      EOD
      apply_manifest(manifest, :expect_changes => true)
      apply_manifest(manifest, :catch_changes => true)
    end
  end
end
