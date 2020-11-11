$compartments = [
  'enterprisemodules (root)/test_compartment_1/bbbb',
  'enterprisemodules (root)/test_compartment_1/bbbb/b',
  'enterprisemodules (root)/test_compartment_1/bbbb/b/c',
]

oci_identity_compartment { $compartments:
  ensure          => 'present',
  description     => 'Weer veranderd',
}

