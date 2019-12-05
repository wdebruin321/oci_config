require_relative '../spec_helper_acceptance'
require_relative '../support/shared_acceptance_specs'
# rubocop: disable Style/AlignParameters

describe 'oci_identity_dynamic_group' do
  include_context 'setup'
  test_name = unique_test_name

  let(:resource_name) { "test_dynamic_group_#{test_name}" }

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


  context 'dynamic group does not exists' do
    it 'should add the dynamic group idempotent' do
      manifest = <<-EOD
       oci_identity_dynamic_group { 'enterprisemodules (root)/#{resource_name}':
          ensure        => 'present',
          description   => 'description',
          matching_rule => "any {ANY {instance.id = 'ocid1.instance.region1.sea.abzwkljrobrgevdin34ftbzurf6vqutavtfqadaa2xlj3e66qwudvljkffxa'}}",
          freeform_tags => {'test' => 'yes'},
        }
      EOD
      apply_manifest(manifest, :expect_changes => true)
      apply_manifest(manifest, :catch_changes => true)
    end
  end

  context "dynamic group exists" do
    it "should change the dynamic group idempotent" do
      manifest = <<-EOD
        oci_identity_dynamic_group { 'enterprisemodules (root)/#{resource_name}':
          ensure        => 'present',
          description   => 'changed',
          matching_rule => "any {ANY {instance.id = 'ocid1.instance.region1.sea.abzwkljrobrgevdin34ftbzurf6vqutavtfqadaa2xlj3e65qwudvljkffxa'}}",
        }
      EOD
      apply_manifest(manifest, :expect_changes => true)
      apply_manifest(manifest, :catch_changes => true)
    end

    it "should remove the dynamic group idempotent" do
      manifest = <<-EOD
        oci_identity_dynamic_group { 'enterprisemodules (root)/#{resource_name}':
          ensure  => 'absent',
        }
      EOD
      apply_manifest(manifest, :expect_changes => true)
      apply_manifest(manifest, :catch_changes => true)
    end
  end
end
