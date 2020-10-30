require_relative '../spec_helper_acceptance'
require_relative '../support/shared_acceptance_specs'
# rubocop: disable Style/AlignParameters

describe 'oci_identity_tag_namespace' do
  include_context 'setup'
  test_name = unique_test_name

  let(:resource_name) { "acceptance_tests/test_namespace_#{test_name}" }

  before(:all) do
    manifest = <<-EOD
    EOD
    # apply_manifest(manifest, :expect_changes => true)
  end

  after(:all) do
    manifest = <<-EOD
    EOD
    # apply_manifest(manifest, :expect_changes => true)
end


  context 'tag namespace does not exists' do
    it 'should add the tag namespace idempotent' do
      manifest = <<-EOD
       oci_identity_tag_namespace { 'enterprisemodules (root)/#{resource_name}':
          ensure              => 'present',
          description         => 'test namespace',
        }
      EOD
      apply_manifest(manifest, :expect_changes => true)
      apply_manifest(manifest, :catch_changes => true)
    end
  end

  context "tag namespace exists" do
    it "should change the tag namespace idempotent" do
      manifest = <<-EOD
        oci_identity_tag_namespace { 'enterprisemodules (root)/#{resource_name}':
          ensure       => 'present',
          description  => 'changed test namespace',
         freeform_tags => {'test' => 'yes'},
        }
      EOD
      apply_manifest(manifest, :expect_changes => true)
      apply_manifest(manifest, :catch_changes => true)
    end

    xit "should remove the tag namespace idempotent" do
      manifest = <<-EOD
        oci_identity_tag_namespace { 'enterprisemodules (root)/#{resource_name}':
          ensure  => 'absent',
          }
      EOD
      apply_manifest(manifest, :expect_changes => true)
      apply_manifest(manifest, :catch_changes => true)
    end
  end
end
