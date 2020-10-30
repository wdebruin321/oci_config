require_relative '../spec_helper_acceptance'
require_relative '../support/shared_acceptance_specs'
# rubocop: disable Style/AlignParameters

describe 'oci_identity_tag' do
  include_context 'setup'
  test_name = unique_test_name

  let(:resource_name) { "#{test_name}_namespace:test_tag_#{test_name}" }

  before(:all) do
    manifest = <<-EOD
    oci_identity_tag_namespace { 'enterprisemodules (root)/acceptance_tests/#{test_name}_namespace':
      ensure      => 'present',
      description => 'test namespace',
    }
    EOD
    apply_manifest(manifest, :expect_changes => true)
  end

  after(:all) do
    manifest = <<-EOD
      oci_identity_tag_namespace { 'enterprisemodules (root)/acceptance_tests/#{test_name}_namespace':
        ensure => 'absent',
      }
    EOD
    # It won't delete all the tags
    # apply_manifest(manifest, :expect_changes => true)
end


  context 'tag does not exists' do
    it 'should add the tag  idempotent' do
      manifest = <<-EOD
       oci_identity_tag { 'enterprisemodules (root)/#{resource_name}':
          ensure      => 'present',
          description => 'test ',
        }
      EOD
      apply_manifest(manifest, :expect_changes => true)
      apply_manifest(manifest, :catch_changes => true)
    end
  end

  context "tag exists" do
    it "should change the tag idempotent" do
      manifest = <<-EOD
      oci_identity_tag { 'enterprisemodules (root)/#{resource_name}':
        ensure      => 'present',
        description => 'Changed description',
      }
      EOD
      apply_manifest(manifest, :expect_changes => true)
      apply_manifest(manifest, :catch_changes => true)
    end

    it "should remove the tag idempotent" do
      manifest = <<-EOD
        oci_identity_tag { 'enterprisemodules (root)/#{resource_name}':
          ensure      => 'absent',
        }
      EOD
      apply_manifest(manifest, :expect_changes => true)
      apply_manifest(manifest, :catch_changes => true)
    end
  end
end
