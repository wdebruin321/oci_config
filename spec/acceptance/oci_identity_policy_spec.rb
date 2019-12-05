require_relative '../spec_helper_acceptance'
require_relative '../support/shared_acceptance_specs'
# rubocop: disable Style/AlignParameters

describe 'oci_identity_policy' do
  include_context 'setup'
  test_name = unique_test_name

  let(:resource_name) { "acceptance_tests/test_policy__#{test_name}" }

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

  context 'policy does not exists' do
    it 'should add the policy idempotent' do
      manifest = <<-EOD
       oci_identity_policy { 'enterprisemodules (root)/#{resource_name}':
          ensure        => 'present',
          description   => 'test_policy',
          statements    => ['Allow group Administrators to manage all-resources in compartment acceptance_tests'],
        }
      EOD
      apply_manifest(manifest, :expect_changes => true)
      apply_manifest(manifest, :catch_changes => true)
    end
  end

  context "policy exists" do
    it "should change the policy idempotent" do
      manifest = <<-EOD
        oci_identity_policy { 'enterprisemodules (root)/#{resource_name}':
          ensure     => 'present',
          statements => ['Allow group Administrators to manage users in compartment acceptance_tests'],
        }
      EOD
      apply_manifest(manifest, :expect_changes => true)
      apply_manifest(manifest, :catch_changes => true)
    end

    it "should remove the policy idempotent" do
      manifest = <<-EOD
        oci_identity_policy { 'enterprisemodules (root)/#{resource_name}':
          ensure  => 'absent',
        }
      EOD
      apply_manifest(manifest, :expect_changes => true)
      apply_manifest(manifest, :catch_changes => true)
    end
  end
end
