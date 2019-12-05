require_relative '../spec_helper_acceptance'
require_relative '../support/shared_acceptance_specs'
# rubocop: disable Style/AlignParameters

describe 'oci_core_cpe' do
  include_context 'setup'
  test_name = unique_test_name

  let(:resource_name) { "acceptance_tests/test_cpe_#{test_name}" }

  context 'cpe does not exists' do
    it 'should add the cpe idempotent' do
      manifest = <<-EOD
        oci_core_cpe { 'enterprisemodules (root)/#{resource_name}':
          ensure        => 'present',
          ip_address    => '10.0.0.1',
          freeform_tags => {'test' => 'no'},
        }
      EOD
      apply_manifest(manifest, :expect_changes => true)
      apply_manifest(manifest, :catch_changes => true)
    end
  end

  context "cpe exists" do
    it "should change the cpe idempotent" do
      manifest = <<-EOD
        oci_core_cpe { 'enterprisemodules (root)/#{resource_name}':
          ensure          => 'present',
          ip_address => '10.0.0.1',
          freeform_tags => {'test' => 'yes',}
        }
      EOD
      apply_manifest(manifest, :expect_changes => true)
      apply_manifest(manifest, :catch_changes => true)
    end

    it "should remove the cpe idempotent" do
      manifest = <<-EOD
        oci_core_cpe { 'enterprisemodules (root)/#{resource_name}':
          ensure          => 'absent',
        }
      EOD
      apply_manifest(manifest, :expect_changes => true)
    apply_manifest(manifest, :catch_changes => true)
    end
  end
end
