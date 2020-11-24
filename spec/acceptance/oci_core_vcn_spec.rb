require_relative '../spec_helper_acceptance'
require_relative '../support/shared_acceptance_specs'
# rubocop: disable Style/AlignParameters

describe 'oci_core_vcn' do
  include_context 'setup'
  test_name = unique_test_name

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

  let(:resource_name) { "acceptance_tests/test_vcn_#{test_name}" }

  context 'vcn does not exists' do
    it 'should add the vcn idempotent' do
      manifest = <<-EOD
       oci_core_vcn { 'enterprisemodules (root)/#{resource_name}':
          ensure        => 'present',
          cidr_block    => '10.0.0.0/16',
          freeform_tags => {'test' => 'yes'},
        }
      EOD
      apply_manifest(manifest, :expect_changes => true)
      apply_manifest(manifest, :catch_changes => true)
    end
  end

  context "vcn exists" do
    it "should change the vcn idempotent" do
      manifest = <<-EOD
        oci_core_vcn { 'enterprisemodules (root)/#{resource_name}':
          ensure          => 'present',
          freeform_tags   => {'test' => 'again'},
        }
      EOD
      apply_manifest(manifest, :expect_changes => true)
      apply_manifest(manifest, :catch_changes => true)
    end

    it "should remove the vcn idempotent" do
      manifest = <<-EOD
        oci_core_vcn { 'enterprisemodules (root)/#{resource_name}':
          ensure  => 'absent',
          }
      EOD
      apply_manifest(manifest, :expect_changes => true)
      apply_manifest(manifest, :catch_changes => true)
    end
  end
end
