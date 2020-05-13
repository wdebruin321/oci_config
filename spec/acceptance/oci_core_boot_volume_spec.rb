require_relative '../spec_helper_acceptance'
require_relative '../support/shared_acceptance_specs'
# rubocop: disable Style/AlignParameters

xdescribe 'oci_core_boot_volume' do
  include_context 'setup'
  test_name = unique_test_name

  let(:resource_name) { "acceptance_tests/test_boot_volume_#{test_name}" }

  context 'boot volume does not exists' do
    it 'should add the boot volume idempotent' do
      manifest = <<-EOD
        oci_core_boot_volume { 'enterprisemodules (root)/#{resource_name}':
          ensure              => 'present',
          availability_domain => 'ARML:EU-FRANKFURT-1-AD-1',
          backup_policy       => 'bronze',
          source_details      => {
            'source_type' => 'image',
            'image' => 'Oracle-Linux-7.7-2019.12.18-0'
          },
                  freeform_tags       => {'test' => 'no'},
        }
      EOD
      apply_manifest(manifest, :expect_changes => true)
      apply_manifest(manifest, :catch_changes => true)
    end
  end

context "boot volume exists" do
  it "should change the boot volume idempotent" do
      manifest = <<-EOD
        oci_core_boot_volume { 'enterprisemodules (root)/#{resource_name}':
          ensure          => 'present',
          backup_policy   => 'silver',
        }
      EOD
      apply_manifest(manifest, :expect_changes => true)
      apply_manifest(manifest, :catch_changes => true)
    end

  it "should remove the boot volume idempotent" do
      manifest = <<-EOD
        oci_core_boot_volume { 'enterprisemodules (root)/#{resource_name}':
          ensure          => 'absent',
        }
      EOD
      apply_manifest(manifest, :expect_changes => true)
    apply_manifest(manifest, :catch_changes => true)
    end
  end
end
