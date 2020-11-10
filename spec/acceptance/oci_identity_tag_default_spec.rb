require_relative '../spec_helper_acceptance'
require_relative '../support/shared_acceptance_specs'
# rubocop: disable Style/AlignParameters

describe 'oci_identity_tag_default' do
  include_context 'setup'
  test_name = unique_test_name

  let(:resource_name) { "acceptance_tests/namespace_#{test_name}:key" }

  before(:all) do
    manifest = <<-EOD
    oci_identity_tag_namespace { 'enterprisemodules (root)/acceptance_tests/namespace_#{test_name}':
      ensure      => 'present',
      description => 'test namespace',
    }
    oci_identity_tag { 'enterprisemodules (root)/namespace_#{test_name}:key':
      ensure      => 'present',
      description => 'test tag',
    }

    EOD
    apply_manifest(manifest, :expect_changes => true)
  end

  after(:all) do
    manifest = <<-EOD
      oci_identity_tag { 'enterprisemodules (root)/namespace_#{test_name}:key':
        ensure      => 'absent',
      }
      oci_identity_tag_namespace { 'enterprisemodules (root)/#{test_name}':
        ensure => 'absent',
      }
    EOD
    # It won't delete all the tags
    apply_manifest(manifest, :expect_changes => true)
end


  context 'tag default does not exists' do
    it 'should add the tag  idempotent' do
      manifest = <<-EOD
       oci_identity_tag_default { 'enterprisemodules (root)/#{resource_name}':
          ensure      => 'present',
          value       => 'first time',
        }
      EOD
      apply_manifest(manifest, :expect_changes => true)
      apply_manifest(manifest, :catch_changes => true)
    end
  end

  context "tag default exists" do
    it "should change the tag  idempotent" do
      manifest = <<-EOD
      oci_identity_tag_default { 'enterprisemodules (root)/#{resource_name}':
        ensure      => 'present',
        value       => 'Changed value',
      }
      EOD
      apply_manifest(manifest, :expect_changes => true)
      apply_manifest(manifest, :catch_changes => true)
    end

    it "should remove the default tag dempotent" do
      manifest = <<-EOD
        oci_identity_tag_default { 'enterprisemodules (root)/#{resource_name}':
          ensure      => 'absent',
        }
      EOD
      apply_manifest(manifest, :expect_changes => true)
      apply_manifest(manifest, :catch_changes => true)
    end
  end
end
