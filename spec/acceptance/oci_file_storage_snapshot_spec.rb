require_relative '../spec_helper_acceptance'
require_relative '../support/shared_acceptance_specs'
# rubocop: disable Style/AlignParameters

describe 'oci_file_storage_snapshot' do
  include_context 'setup'
  test_name = unique_test_name

  let(:resource_name) { "test_snapshot_#{test_name}" }

  before(:all) do
    manifest = <<-EOD
      oci_core_vcn { 'enterprisemodules (root)/acceptance_tests/vcn_#{test_name}':
        ensure        => 'present',
        cidr_block    => '10.0.0.0/16',
        freeform_tags => {'test' => 'yes'},
      }

      oci_core_subnet { 'enterprisemodules (root)/acceptance_tests/subnet_#{test_name}':
        ensure             => 'present',
        cidr_block         => '10.0.0.0/16',
        vcn                => 'acceptance_tests/vcn_#{test_name}',
        virtual_router_ip  => '10.0.0.2',
        virtual_router_mac => '00:00:17:9B:B0:3A',
      }

      oci_file_storage_file_system { 'enterprisemodules (root)/acceptance_tests/file_system_#{test_name}':
        ensure              => 'present',
        availability_domain => 'arMl:EU-FRANKFURT-1-AD-1',
      }
    EOD
    apply_manifest(manifest, :expect_changes => true)
  end

  after(:all) do
    manifest = <<-EOD
    oci_file_storage_file_system { 'enterprisemodules (root)/acceptance_tests/file_system_#{test_name}':
      ensure => 'absent',
    }

    -> oci_core_subnet { 'enterprisemodules (root)/acceptance_tests/subnet_#{test_name}':
      ensure        => 'absent',
      # absent_states => ['TERMINATED'], # Really wait unit it is gone so we can remove the setup too
    }

    oci_core_vcn { 'enterprisemodules (root)/acceptance_tests/vcn_#{test_name}':
      ensure       => 'absent',
    }


    EOD
    apply_manifest(manifest, :expect_changes => true)
  end


  context 'snapshot does not exists' do
    it 'should add the export idempotent' do
      manifest = <<-EOD
        oci_file_storage_snapshot { 'enterprisemodules (root)/acceptance_tests/file_system_#{test_name}/#{resource_name}':
          ensure          => 'present',
        }
      EOD
      apply_manifest(manifest, :expect_changes => true)
      apply_manifest(manifest, :catch_changes => true)
    end
  end

  context "snapshot exists" do

    it "should change the export idempotent" do
      manifest = <<-EOD
      oci_file_storage_snapshot { 'enterprisemodules (root)/acceptance_tests/file_system_#{test_name}/#{resource_name}':
        ensure        => 'present',
        freeform_tags => {'test' => 'yes'},
      }
      EOD
      apply_manifest(manifest, :expect_changes => true)
      apply_manifest(manifest, :catch_changes => true)
    end

    it "should remove the snapshot idempotent" do
      manifest = <<-EOD
      oci_file_storage_snapshot { 'enterprisemodules (root)/acceptance_tests/file_system_#{test_name}/#{resource_name}':
          ensure        => 'absent',
        }
      EOD
      apply_manifest(manifest, :expect_changes => true)
      apply_manifest(manifest, :catch_changes => true)
    end
  end
end
