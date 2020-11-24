shared_context 'setup' do
  before(:all) do
    apply_manifest(nil, :manifest_file_location => '/root/tenant_setup.pp', :expect_failures => false)
    manifest = <<-EOD
      oci_identity_compartment { 'enterprisemodules (root)/acceptance_tests':
        ensure          => 'present',
        description     => 'Compartment for acceptance tests',
      }
    EOD
    apply_manifest(manifest, :catch_failures => true)
  end
end
