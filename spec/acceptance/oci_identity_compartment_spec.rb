require_relative '../spec_helper_acceptance'
require_relative '../support/shared_acceptance_specs'
# rubocop: disable Style/AlignParameters

describe 'oci_identity_compartment' do
  include_context 'setup'
  test_name = unique_test_name

  let(:resource_name) { "acceptance_tests/test_compartment_#{test_name}" }

  context 'Compartment does not exists' do
    it 'should add the compartment idempotent' do
      manifest = <<-EOD
        oci_identity_compartment { 'enterprisemodules (root)/#{resource_name}':
          ensure          => 'present',
          description     => 'test compartment',
        }
      EOD
      apply_manifest(manifest, :expect_changes => true)
      apply_manifest(manifest, :catch_changes => true)
    end
  end

  context "Compartment exists" do
    it "should change the compartment idempotent" do
      manifest = <<-EOD
        oci_identity_compartment { 'enterprisemodules (root)/#{resource_name}':
          ensure          => 'present',
          description     => 'changed',
        }
      EOD
      apply_manifest(manifest, :expect_changes => true)
      apply_manifest(manifest, :catch_changes => true)
    end

    it "should remove the compartment idempotent" do
      manifest = <<-EOD
        oci_identity_compartment { 'enterprisemodules (root)/#{resource_name}':
          ensure          => 'absent',
        }
      EOD
      apply_manifest(manifest, :expect_changes => true)
    apply_manifest(manifest, :catch_changes => true)
    end
  end
end

