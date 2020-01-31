require_relative '../spec_helper_acceptance'
require_relative '../support/shared_acceptance_specs'
# rubocop: disable Style/AlignParameters

describe 'oci_core_public_ip' do
  include_context 'setup'
  test_name = unique_test_name

  let(:resource_name) { "acceptance_tests/public_ip_#{test_name}" }


  context 'public IP does not exists' do
    it 'should add the public IP idempotent' do
      manifest = <<-EOD
        oci_core_public_ip { 'enterprisemodules (root)/#{resource_name}':
          ensure   => 'present',
          lifetime => 'RESERVED',
        }
      EOD
      apply_manifest(manifest, :expect_changes => true)
      apply_manifest(manifest, :catch_changes => true)
    end
  end

  context "public IP exists" do
    it "should change the public IP idempotent" do
      manifest = <<-EOD
        oci_core_public_ip { 'enterprisemodules (root)/#{resource_name}':
          ensure        => 'present',
          freeform_tags => {'test' => 'no'},
        }
    EOD
      apply_manifest(manifest, :expect_changes => true)
      apply_manifest(manifest, :catch_changes => true)
    end

    it "should remove the public IP idempotent" do
      manifest = <<-EOD
        oci_core_public_ip { 'enterprisemodules (root)/#{resource_name}':
          ensure => 'absent',
        }
      EOD
      apply_manifest(manifest, :expect_changes => true)
      apply_manifest(manifest, :catch_changes => true)
    end
  end
end
