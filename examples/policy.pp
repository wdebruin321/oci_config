
oci_identity_policy { 'enterprisemodules (root)/acceptance_tests/example_policy':
  ensure        => 'present',
  description   => 'test_policy',
  statements    => ['Allow group Administrators to manage all-resources in compartment acceptance_tests'],
  freeform_tags => {'test' => 'yes'},
}
