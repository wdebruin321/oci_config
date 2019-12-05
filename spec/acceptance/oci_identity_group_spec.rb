require_relative '../spec_helper_acceptance'
require_relative '../support/shared_acceptance_specs'
# rubocop: disable Style/AlignParameters

describe 'oci_identity_group' do
  include_context 'setup'
  test_name = unique_test_name

  let(:resource_name) { "test_group__#{test_name}" }

  context 'Group does not exists' do
    it 'should add the group idempotent' do
      manifest = <<-EOD
        oci_identity_group { 'enterprisemodules (root)/#{resource_name}':
          ensure          => 'present',
          description     => 'test group',
        }
      EOD
      apply_manifest(manifest, :expect_changes => true)
      apply_manifest(manifest, :catch_changes => true)
    end
  end

  context "Group exists" do
    before do
      manifest = <<-EOD
      oci_identity_user { 'enterprisemodules (root)/test_user_for_group_test__#{test_name}_1':
        ensure          => 'present',
        description     => 'test user',
      }
      oci_identity_user { 'enterprisemodules (root)/test_user_for_group_test__#{test_name}_2':
        ensure          => 'present',
        description     => 'test user',
      }
      EOD
      apply_manifest(manifest, :expect_failures => false)
    end

    after(:all) do
      manifest = <<-EOD
      oci_identity_user { 'enterprisemodules (root)/test_user_for_group_test__#{test_name}_1':
        ensure          => 'absent',
        }
        oci_identity_user { 'enterprisemodules (root)/test_user_for_group_test__#{test_name}_2':
          ensure          => 'absent',
        }
      EOD
      apply_manifest(manifest, :expect_failures => false)
    end

    it "should allow addition of users idempotently" do
      manifest = <<-EOD
        oci_identity_group { 'enterprisemodules (root)/#{resource_name}':
          ensure => 'present',
          users  => ['test_user_for_group_test__#{test_name}_1','test_user_for_group_test__#{test_name}_2']
        }
      EOD
      apply_manifest(manifest, :expect_changes => true)
      apply_manifest(manifest, :catch_changes => true)
    end

    it "should allow removal of users idempotently" do
      manifest = <<-EOD
        oci_identity_group { 'enterprisemodules (root)/#{resource_name}':
          ensure => 'present',
          users  => ['test_user_for_group_test__#{test_name}_1']
        }
      EOD
      apply_manifest(manifest, :expect_changes => true)
      apply_manifest(manifest, :catch_changes => true)
    end

    it "should change the group idempotent" do
      manifest = <<-EOD
        oci_identity_group { 'enterprisemodules (root)/#{resource_name}':
          ensure          => 'present',
          description     => 'test group changed',
        }
      EOD
      apply_manifest(manifest, :expect_changes => true)
      apply_manifest(manifest, :catch_changes => true)
    end

    it "should remove the group idempotent" do
      manifest = <<-EOD
        oci_identity_group { 'enterprisemodules (root)/#{resource_name}':
          ensure          => 'absent',
        }
      EOD
      apply_manifest(manifest, :expect_changes => true)
      apply_manifest(manifest, :catch_changes => true)
    end
  end
end

