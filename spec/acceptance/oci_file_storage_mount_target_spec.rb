require_relative '../spec_helper_acceptance'
require_relative '../support/shared_acceptance_specs'
# rubocop: disable Style/AlignParameters

describe 'oci_file_storage_mount_target' do
  include_context 'setup'
  test_name = unique_test_name

  let(:resource_name) { "acceptance_tests/test_mount_target_#{test_name}" }

  before(:all) do
    manifest = <<-EOD
      oci_core_vcn { 'enterprisemodules (root)/acceptance_tests/vcn_#{test_name}':
        ensure        => 'present',
        cidr_block    => '10.0.0.0/16',
        freeform_tags => {'test' => 'yes'},
      }

      oci_core_subnet { 'enterprisemodules (root)/acceptance_tests/subnet_#{test_name}':
        ensure             => 'present',
        cidr_block         => '10.0.0.0/24',
        vcn                => 'acceptance_tests/vcn_#{test_name}',
        virtual_router_ip  => '10.0.0.2',
        virtual_router_mac => '00:00:17:9B:B0:3A',
      }

    EOD
    apply_manifest(manifest, :expect_changes => true)
  end

  after(:all) do
    manifest = <<-EOD
    oci_core_subnet { 'enterprisemodules (root)/acceptance_tests/subnet_#{test_name}':
      ensure        => 'absent',
    }

    -> oci_core_vcn { 'enterprisemodules (root)/acceptance_tests/vcn_#{test_name}':
      ensure       => 'absent',
      synchronized => false,
    }
    EOD
    apply_manifest(manifest, :expect_changes => true)
  end


  context 'mount target does not exists' do
    it 'should add the mount target idempotent' do
      manifest = <<-EOD
        oci_file_storage_mount_target { 'enterprisemodules (root)/#{resource_name}':
          ensure              => 'present',
          availability_domain => 'arMl:EU-FRANKFURT-1-AD-1',
          subnet              => 'acceptance_tests/subnet_#{test_name}',
        }
      EOD
      apply_manifest(manifest, :expect_changes => true)
      apply_manifest(manifest, :catch_changes => true)
    end
  end

  context "mount target exists" do

    it "should change the mount target idempotent" do
      manifest = <<-EOD
        oci_file_storage_mount_target { 'enterprisemodules (root)/#{resource_name}':
          ensure              => 'present',
          availability_domain => 'arMl:EU-FRANKFURT-1-AD-1',
          subnet              => 'acceptance_tests/subnet_#{test_name}',
          freeform_tags       => {'test' => 'yes'},
        }
      EOD
      apply_manifest(manifest, :expect_changes => true)
      apply_manifest(manifest, :catch_changes => true)
    end

    it "should remove the mount target idempotent" do
      manifest = <<-EOD
        oci_file_storage_mount_target { 'enterprisemodules (root)/#{resource_name}':
          ensure => 'absent',
        }
      EOD
      apply_manifest(manifest, :expect_changes => true)
      apply_manifest(manifest, :catch_changes => true)
    end
  end
end
