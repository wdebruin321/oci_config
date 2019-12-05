require_relative '../spec_helper_acceptance'
require_relative '../support/shared_acceptance_specs'
# rubocop: disable Style/AlignParameters

describe 'oci_budget_budget' do
  include_context 'setup'
  test_name = unique_test_name

  let(:resource_name) { "test_budget_#{test_name}" }

  context 'Budget does not exists' do
    it 'should add the budget idempotent' do
      manifest = <<-EOD
        oci_budget_budget { 'enterprisemodules (root)/#{resource_name}':
          ensure             => 'present',
          target_compartment => 'acceptance_tests',
          amount             => 100.0,
          description        => 'test Budget',
        }
      EOD
      apply_manifest(manifest, :expect_changes => true)
      apply_manifest(manifest, :catch_changes => true)
    end
  end

  context "Budget exists" do
    it "should change the budget idempotent" do
      manifest = <<-EOD
        oci_budget_budget { 'enterprisemodules (root)/#{resource_name}':
          ensure          => 'present',
          description     => 'changed',
        }
      EOD
      apply_manifest(manifest, :expect_changes => true)
      apply_manifest(manifest, :catch_changes => true)
    end

    it "should remove the budget idempotent" do
      manifest = <<-EOD
        oci_budget_budget { 'enterprisemodules (root)/#{resource_name}':
          ensure          => 'absent',
        }
      EOD
      apply_manifest(manifest, :expect_changes => true)
    apply_manifest(manifest, :catch_changes => true)
    end
  end
end
