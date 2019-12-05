require_relative '../spec_helper_acceptance'
require_relative '../support/shared_acceptance_specs'
# rubocop: disable Style/AlignParameters

describe 'oci_core_drg' do
  include_context 'setup'
  test_name = unique_test_name

  let(:resource_name) { "acceptance_tests/test_drg_#{test_name}" }

  context 'drg does not exists' do
    it 'should add the drg idempotent' do
      manifest = <<-EOD
        oci_core_drg { 'enterprisemodules (root)/#{resource_name}':
          ensure        => 'present',
          freeform_tags => {'test' => 'no'},
        }
      EOD
      apply_manifest(manifest, :expect_changes => true)
      apply_manifest(manifest, :catch_changes => true)
    end
  end

  context "drg exists" do
    it "should change the drg idempotent" do
      manifest = <<-EOD
        oci_core_drg { 'enterprisemodules (root)/#{resource_name}':
          ensure          => 'present',
          freeform_tags   => {'test' => 'yes',}
        }
      EOD
      apply_manifest(manifest, :expect_changes => true)
      apply_manifest(manifest, :catch_changes => true)
    end

    it "should remove the drg idempotent" do
      manifest = <<-EOD
        oci_core_drg { 'enterprisemodules (root)/#{resource_name}':
          ensure          => 'absent',
        }
      EOD
      apply_manifest(manifest, :expect_changes => true)
    apply_manifest(manifest, :catch_changes => true)
    end
  end
end
