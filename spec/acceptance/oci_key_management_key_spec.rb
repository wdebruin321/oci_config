require_relative '../spec_helper_acceptance'
require_relative '../support/shared_acceptance_specs'
# rubocop: disable Style/AlignParameters

describe 'oci_key_management_key' do
  include_context 'setup'
  test_name = unique_test_name

  let(:resource_name) { "acceptance_tests/test_key_#{test_name}" }

  before(:all) do
    manifest = <<-EOD
      oci_key_management_vault { 'enterprisemodules (root)/acceptance_tests/test_vault_#{test_name}':
        ensure        => 'present',
        vault_type    => 'DEFAULT',
      }
    EOD
    apply_manifest(manifest, :expect_changes => true)
  end

  after(:all) do
    manifest = <<-EOD
      oci_key_management_vault { 'enterprisemodules (root)/acceptance_tests/test_vault_#{test_name}':
        ensure       => 'absent',
        synchronized => false,  # It can take a long time. For the test we don'tt need to wait
      }
    EOD
    apply_manifest(manifest, :expect_changes => true)
  end

  context 'key does not exists' do
    it 'should add the key idempotent' do
      manifest = <<-EOD
        oci_key_management_key { 'enterprisemodules (root)/#{resource_name}':
          ensure    => 'present',
          vault     => 'acceptance_tests/test_vault_#{test_name}',
          key_shape =>  {
            algorithm => 'AES',
            length    => 16,
          },
        }
      EOD
      apply_manifest(manifest, :expect_changes => true)
      apply_manifest(manifest, :catch_changes => true)
    end
  end

  context "key exists" do
    it "should change the key idempotent" do
      manifest = <<-EOD
        oci_key_management_key { 'enterprisemodules (root)/#{resource_name}':
          ensure        => 'present',
          freeform_tags => {'test' => 'yes',},
        }
      EOD
      apply_manifest(manifest, :expect_changes => true)
      apply_manifest(manifest, :catch_changes => true)
    end

    it "should remove the key idempotent" do
      manifest = <<-EOD
        oci_key_management_key { 'enterprisemodules (root)/#{resource_name}':
          ensure => 'absent',
        }
      EOD
      apply_manifest(manifest, :expect_changes => true)
      apply_manifest(manifest, :catch_changes => true)
    end
  end
end
