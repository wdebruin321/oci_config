require_relative '../spec_helper_acceptance'
require_relative '../support/shared_acceptance_specs'
#rubocop: disable Style/AlignParameters

describe 'oci_core_volume' do
  include_context 'setup'
  test_name = unique_test_name

  let(:resource_name) { "acceptance_tests/test_volume_#{test_name}" }

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

  context 'volume does not exists' do
    it 'should add the volume idempotent' do
      manifest = <<-EOD
       oci_core_volume { 'enterprisemodules (root)/#{resource_name}':
          ensure              => 'present',
          availability_domain => 'arMl:EU-FRANKFURT-1-AD-1',
          size_in_gbs         => 50,
          vpus_per_gb         => 0,
          freeform_tags       => {'test' => 'yes'},
        }
      EOD
      apply_manifest(manifest, :expect_changes => true)
      apply_manifest(manifest, :catch_changes => true)
    end
  end

  context "volume exists" do
    it "should change the volume idempotent" do
      manifest = <<-EOD
        oci_core_volume { 'enterprisemodules (root)/#{resource_name}':
          ensure        => 'present',
          size_in_gbs   => 60,
          vpus_per_gb   => 20,
          freeform_tags => {'test' => 'yes'},
        }
      EOD
      apply_manifest(manifest, :expect_changes => true)
      apply_manifest(manifest, :catch_changes => true)
    end

    it "should remove the volume idempotent" do
      manifest = <<-EOD
        oci_core_volume { 'enterprisemodules (root)/#{resource_name}':
          ensure  => 'absent',
          }
      EOD
      apply_manifest(manifest, :expect_changes => true)
      apply_manifest(manifest, :catch_changes => true)
    end
  end
end
