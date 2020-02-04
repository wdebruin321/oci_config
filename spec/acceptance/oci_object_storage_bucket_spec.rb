require_relative '../spec_helper_acceptance'
require_relative '../support/shared_acceptance_specs'
# rubocop: disable Style/AlignParameters

describe 'oci_object_storage_bucket' do
  include_context 'setup'
  test_name = unique_test_name

  let(:resource_name) { "test_bucket_#{test_name}" }

  context 'bucket does not exists' do
    it 'should add the bucket idempotent' do
      manifest = <<-EOD
        oci_object_storage_bucket { 'enterprisemodules (root)/#{resource_name}':
          ensure        => 'present',
          freeform_tags => {'test' => 'yes'},
        }
      EOD
      apply_manifest(manifest, :expect_changes => true)
      apply_manifest(manifest, :catch_changes => true)
    end
  end

  context "bucket exists" do
    it "should change the bucket idempotent" do
      manifest = <<-EOD
        oci_object_storage_bucket { 'enterprisemodules (root)/#{resource_name}':
          ensure        => 'present',
          freeform_tags => {'test' => 'no'},
        }
      EOD
      apply_manifest(manifest, :expect_changes => true)
      apply_manifest(manifest, :catch_changes => true)
    end

    it "should remove the bucket idempotent" do
      manifest = <<-EOD
        oci_object_storage_bucket { 'enterprisemodules (root)/#{resource_name}':
          ensure => 'absent',
        }
      EOD
      apply_manifest(manifest, :expect_changes => true)
    apply_manifest(manifest, :catch_changes => true)
    end
  end
end
