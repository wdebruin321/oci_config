require_relative '../spec_helper_acceptance'
require_relative '../support/shared_acceptance_specs'
# rubocop: disable Style/AlignParameters

# Needs the gem version 2.8+ 2.8 is broken and 2.7 doesn't include it.
xdescribe 'oci_core_volume_backup_policy' do
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

  let(:resource_name) { "acceptance_tests/test_backup_policy_#{test_name}" }

  context 'policy does not exists' do
    it 'should add the policy idempotent' do
      manifest = <<-EOD
       oci_core_volume_backup_policy { 'enterprisemodules (root)/#{resource_name}':
          ensure              => 'present',
          schedules    => [
            {
              'backup_type' => 'INCREMENTAL',
              'offset_seconds' => 0,
              'period' => 'ONE_WEEK',
              'retention_seconds' => 2419200
            },
            {
              'backup_type' => 'INCREMENTAL',
              'offset_seconds' => 0,
              'period' => 'ONE_MONTH',
              'retention_seconds' => 31557600
            },
            {
              'backup_type' => 'FULL',
              'offset_seconds' => 0,
              'period' => 'ONE_YEAR',
              'retention_seconds' => 157680000
            }],
          freeform_tags       => {'test' => 'yes'},
        }
      EOD
      apply_manifest(manifest, :expect_changes => true)
      apply_manifest(manifest, :catch_changes => true)
    end
  end

  context "policy exists" do
    it "should change the policy idempotent" do
      manifest = <<-EOD
        oci_core_volume_backup_policy { 'enterprisemodules (root)/#{resource_name}':
          ensure          => 'present',
            schedules    => [
              {
                'backup_type' => 'INCREMENTAL',
                'offset_seconds' => 0,
                'period' => 'ONE_MONTH',
                'retention_seconds' => 2419200
              },
              {
                'backup_type' => 'INCREMENTAL',
                'offset_seconds' => 3600,
                'period' => 'ONE_YEAR',
                'retention_seconds' => 31557600
              },
              {
                'backup_type' => 'FULL',
                'offset_seconds' => 0,
                'period' => 'ONE_YEAR',
                'retention_seconds' => 157680000
              }],
            freeform_tags   => {'test' => 'yes'},
        }
      EOD
      apply_manifest(manifest, :expect_changes => true)
      apply_manifest(manifest, :catch_changes => true)
    end

    it "should remove the policy idempotent" do
      manifest = <<-EOD
        oci_core_volume_backup_policy { 'enterprisemodules (root)/#{resource_name}':
          ensure  => 'absent',
        }
      EOD
      apply_manifest(manifest, :expect_changes => true)
      apply_manifest(manifest, :catch_changes => true)
    end
  end
end
