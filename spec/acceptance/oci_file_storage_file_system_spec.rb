require_relative '../spec_helper_acceptance'
require_relative '../support/shared_acceptance_specs'
# rubocop: disable Style/AlignParameters

describe 'oci_file_storage_file_system' do
  include_context 'setup'
  test_name = unique_test_name

  let(:resource_name) { "acceptance_tests/test_file_system_#{test_name}" }

  context 'file system does not exists' do
    it 'should add the file system idempotent' do
      manifest = <<-EOD
        oci_file_storage_file_system { 'enterprisemodules (root)/#{resource_name}':
          ensure              => 'present',
          availability_domain => 'arMl:EU-FRANKFURT-1-AD-1',
        }
      EOD
      apply_manifest(manifest, :expect_changes => true)
      apply_manifest(manifest, :catch_changes => true)
    end
  end

  context "file system exists" do

    it "should change the file system idempotent" do
      manifest = <<-EOD
        oci_file_storage_file_system { 'enterprisemodules (root)/#{resource_name}':
          ensure              => 'present',
          availability_domain => 'arMl:EU-FRANKFURT-1-AD-1',
          freeform_tags       => {'test' => 'yes'},
        }
      EOD
      apply_manifest(manifest, :expect_changes => true)
      apply_manifest(manifest, :catch_changes => true)
    end

    it "should remove the file system idempotent" do
      manifest = <<-EOD
        oci_file_storage_file_system { 'enterprisemodules (root)/#{resource_name}':
          ensure => 'absent',
        }
      EOD
      apply_manifest(manifest, :expect_changes => true)
      apply_manifest(manifest, :catch_changes => true)
    end
  end
end
