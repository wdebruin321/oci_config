require_relative '../spec_helper_acceptance'
require_relative '../support/shared_acceptance_specs'
# rubocop: disable Style/AlignParameters

describe 'oci_identity_user' do
  include_context 'setup'
  test_name = unique_test_name

  let(:resource_name) { "test_user_#{test_name}" }

  context 'User does not exists' do
    it 'should add the user idempotent' do
      manifest = <<-EOD
        oci_identity_user { 'enterprisemodules (root)/#{resource_name}':
          ensure          => 'present',
          description     => 'test user',
        }
      EOD
      apply_manifest(manifest, :expect_changes => true)
      apply_manifest(manifest, :catch_changes => true)
    end
  end

  context "User exists and belongs to group" do
    before do
      manifest = <<-EOD
      oci_identity_group { 'enterprisemodules (root)/test_group_#{test_name}':
        ensure          => 'present',
        description     => 'test group 1',
        users           => ['#{resource_name}'],
      }
      EOD
      apply_manifest(manifest, :expect_failures => false)
    end

    after(:all) do
      manifest = <<-EOD
      oci_identity_group { 'enterprisemodules (root)/test_group_#{test_name}':
        ensure          => 'absent',
      }
      EOD
      apply_manifest(manifest, :expect_failures => false)
    end

    it "should change the user idempotent" do
      manifest = <<-EOD
        oci_identity_user { 'enterprisemodules (root)/#{resource_name}':
          ensure          => 'present',
          description     => 'test user changed',
        }
      EOD
      apply_manifest(manifest, :expect_changes => true)
      apply_manifest(manifest, :catch_changes => true)
    end

    it "should remove the user idempotent" do
      manifest = <<-EOD
        oci_identity_user { 'enterprisemodules (root)/#{resource_name}':
          ensure          => 'absent',
        }
      EOD
      apply_manifest(manifest, :expect_changes => true)
      apply_manifest(manifest, :catch_changes => true)
    end
  end
end

