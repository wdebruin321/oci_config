# TODO: Implement this
require_relative '../spec_helper_acceptance'
require_relative '../support/shared_acceptance_specs'
# rubocop: disable Style/AlignParameters

xdescribe 'oci_identity_provider' do
  include_context 'setup'
  test_name = unique_test_name

  let(:resource_name) { "test_provider__#{test_name}" }

  context 'provider does not exists' do
    it 'should add the provider idempotent' do
      manifest = <<-EOD
        oci_identity_provider { 'enterprisemodules (root)/#{resource_name}':
          ensure          => 'present',
          description     => 'test provider',
        }
      EOD
      apply_manifest(manifest, :expect_changes => true)
      apply_manifest(manifest, :catch_changes => true)
    end
  end

  context "provider exists" do

    it "should allow addition of users idempotently" do
      manifest = <<-EOD
        oci_identity_provider { 'enterprisemodules (root)/#{resource_name}':
          ensure => 'present',
        }
      EOD
      apply_manifest(manifest, :expect_changes => true)
      apply_manifest(manifest, :catch_changes => true)
    end

    it "should allow removal of users idempotently" do
      manifest = <<-EOD
        oci_identity_provider { 'enterprisemodules (root)/#{resource_name}':
          ensure => 'present',
        }
      EOD
      apply_manifest(manifest, :expect_changes => true)
      apply_manifest(manifest, :catch_changes => true)
    end

    it "should change the provider idempotent" do
      manifest = <<-EOD
        oci_identity_provider { 'enterprisemodules (root)/#{resource_name}':
          ensure          => 'present',
          description     => 'test provider changed',
        }
      EOD
      apply_manifest(manifest, :expect_changes => true)
      apply_manifest(manifest, :catch_changes => true)
    end

    it "should remove the provider idempotent" do
      manifest = <<-EOD
        oci_identity_provider { 'enterprisemodules (root)/#{resource_name}':
          ensure          => 'absent',
        }
      EOD
      apply_manifest(manifest, :expect_changes => true)
      apply_manifest(manifest, :catch_changes => true)
    end
  end
end