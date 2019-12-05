require_relative '../spec_helper_acceptance'
require_relative '../support/shared_acceptance_specs'
# rubocop: disable Style/AlignParameters

describe 'oci_core_nat_gateway' do
  include_context 'setup'
  test_name = unique_test_name

  let(:resource_name) { "acceptance_tests/test_nat_gateway_#{test_name}" }

  before(:all) do
    manifest = <<-EOD
      oci_core_vcn { 'enterprisemodules (root)/acceptance_tests/vcn_#{test_name}':
        ensure     => 'present',
        cidr_block => '10.0.0.0/16',
      }

    EOD
    apply_manifest(manifest, :expect_changes => true)
  end

  after(:all) do
    manifest = <<-EOD
      oci_core_vcn { 'enterprisemodules (root)/acceptance_tests/vcn_#{test_name}':
        ensure => 'absent',
      }
    EOD
    apply_manifest(manifest, :expect_changes => true)
  end


  context 'nat gateway does not exists' do
    it 'should add the nat gateway idempotent' do
      manifest = <<-EOD
        oci_core_nat_gateway { 'enterprisemodules (root)/#{resource_name}':
          ensure      => 'present',
          vcn         => 'acceptance_tests/vcn_#{test_name}',
        }
      EOD
      apply_manifest(manifest, :expect_changes => true)
      apply_manifest(manifest, :catch_changes => true)
    end
  end

  context "nat gateway exists" do
    it "should change the nat gateway idempotent" do
      manifest = <<-EOD
        oci_core_nat_gateway { 'enterprisemodules (root)/#{resource_name}':
            ensure        => 'present',
            vcn           => 'acceptance_tests/vcn_#{test_name}',
            freeform_tags => {'test' => 'no'},
          }
      EOD
      apply_manifest(manifest, :expect_changes => true)
      apply_manifest(manifest, :catch_changes => true)
    end

    it "should remove the nat gateway idempotent" do
      manifest = <<-EOD
        oci_core_nat_gateway { 'enterprisemodules (root)/#{resource_name}':
          ensure => 'absent',
        }
      EOD
      apply_manifest(manifest, :expect_changes => true)
      apply_manifest(manifest, :catch_changes => true)
    end
  end
end
