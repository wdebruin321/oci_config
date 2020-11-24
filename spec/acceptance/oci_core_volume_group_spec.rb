require_relative '../spec_helper_acceptance'
require_relative '../support/shared_acceptance_specs'
# rubocop: disable Style/AlignParameters

describe 'oci_core_volume_group' do
  include_context 'setup'
  test_name = unique_test_name

  let(:resource_name) { "acceptance_tests/test_volume_group_#{test_name}" }

  before(:all) do
    manifest = <<-EOD
    oci_core_volume { ['enterprisemodules (root)/acceptance_tests/test_volume_#{test_name}_1', 'enterprisemodules (root)/acceptance_tests/test_volume_#{test_name}_2']:
      ensure              => 'present',
      availability_domain => 'arMl:EU-FRANKFURT-1-AD-1',
      size_in_gbs         => 50,
    }
    EOD
    apply_manifest(manifest, :expect_changes => true)
  end

  after(:all) do
    manifest = <<-EOD
    oci_core_volume { ['enterprisemodules (root)/acceptance_tests/test_volume_#{test_name}_1', 'enterprisemodules (root)/acceptance_tests/test_volume_#{test_name}_2']:
        ensure => 'absent',
      }
    EOD
    apply_manifest(manifest, :expect_changes => true)
  end


  context 'volume group does not exists' do
    it 'should add the volume group idempotent' do
      manifest = <<-EOD
       oci_core_volume_group { 'enterprisemodules (root)/#{resource_name}':
          ensure              => 'present',
          availability_domain => 'arMl:EU-FRANKFURT-1-AD-1',
          volumes             => ['acceptance_tests/test_volume_#{test_name}_1'],
          freeform_tags       => {'test' => 'yes'},
        }
      EOD
      apply_manifest(manifest, :expect_changes => true)
      apply_manifest(manifest, :catch_changes => true)
    end
  end

  context "volume group exists" do
    it "should change the volume group idempotent" do
      manifest = <<-EOD
        oci_core_volume_group { 'enterprisemodules (root)/#{resource_name}':
          ensure              => 'present',
          availability_domain => 'arMl:EU-FRANKFURT-1-AD-1',
          freeform_tags       => {'test' => 'again'},
        }
      EOD
      apply_manifest(manifest, :expect_changes => true)
      apply_manifest(manifest, :catch_changes => true)
    end

    it "should add a disk to the volume group idempotent" do
      manifest = <<-EOD
        oci_core_volume_group { 'enterprisemodules (root)/#{resource_name}':
          ensure  => 'present',
          volumes => ['acceptance_tests/test_volume_#{test_name}_1', 'acceptance_tests/test_volume_#{test_name}_2'],
        }
      EOD
      apply_manifest(manifest, :expect_changes => true)
      apply_manifest(manifest, :catch_changes => true)
    end

    it "should remove a disk from the volume group idempotent" do
      manifest = <<-EOD
        oci_core_volume_group { 'enterprisemodules (root)/#{resource_name}':
          ensure  => 'present',
          volumes => ['acceptance_tests/test_volume_#{test_name}_2'],
        }
      EOD
      apply_manifest(manifest, :expect_changes => true)
      apply_manifest(manifest, :catch_changes => true)
    end

    it "should remove the volume group idempotent" do
      manifest = <<-EOD
        oci_core_volume_group { 'enterprisemodules (root)/#{resource_name}':
          ensure  => 'absent',
        }
      EOD
      apply_manifest(manifest, :expect_changes => true)
      apply_manifest(manifest, :catch_changes => true)
    end
  end
end
