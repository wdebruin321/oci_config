require_relative '../spec_helper_acceptance'
require_relative '../support/shared_acceptance_specs'
# rubocop: disable Style/AlignParameters

describe 'oci_key_management_vault' do
  include_context 'setup'
  test_name = unique_test_name

  let(:resource_name) { "acceptance_tests/test_vault_#{test_name}" }

  context 'vault does not exists' do
    it 'should add the vault idempotent' do
      manifest = <<-EOD
        oci_key_management_vault { 'enterprisemodules (root)/#{resource_name}':
          ensure        => 'present',
          vault_type    => 'DEFAULT',
          freeform_tags => {'test' => 'no'},
        }
      EOD
      apply_manifest(manifest, :expect_changes => true)
      apply_manifest(manifest, :catch_changes => true)
    end
  end

  context "vault exists" do
    it "should change the vault idempotent" do
      manifest = <<-EOD
        oci_key_management_vault { 'enterprisemodules (root)/#{resource_name}':
          ensure          => 'present',
          freeform_tags   => {'test' => 'yes',}
        }
      EOD
      apply_manifest(manifest, :expect_changes => true)
      apply_manifest(manifest, :catch_changes => true)
    end

    it "should remove the vault idempotent" do
      manifest = <<-EOD
        oci_key_management_vault { 'enterprisemodules (root)/#{resource_name}':
          ensure       => 'absent',
          synchronized => false,  # It can take a long time. For the test we don'tt need to wait

        }
      EOD
      apply_manifest(manifest, :expect_changes => true)
      apply_manifest(manifest, :catch_changes => true)
    end
  end
end
