oci_core_volume { 'enterprisemodules (root)/test_compartment_1/copy_of_test_2':
  ensure              => 'present',
  availability_domain => 'arMl:EU-FRANKFURT-1-AD-1',
  source_details      => {
    type   => 'volume',
    # id => 'ocid1.volume.oc1.eu-frankfurt-1.abtheljsytgtfwisiuqkxxzkkvdk2pegs6ipmxrq6ye3sjpbty6x4zvzsgza',
    name => 'test_compartment_1/test_1',
  }
}
