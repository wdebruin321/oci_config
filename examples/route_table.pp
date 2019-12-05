oci_core_vcn { 'enterprisemodules (root)/acceptance_tests/vcn_4':
  ensure     => 'present',
  cidr_block => '10.0.0.0/16',
}

oci_core_internet_gateway { 'enterprisemodules (root)/acceptance_tests/test_ig_2':
  ensure     => 'present',
  vcn        => 'acceptance_tests/vcn_4',
  is_enabled => true,
}

oci_core_route_table { 'enterprisemodules (root)/acceptance_tests/testa':
  ensure          => 'present',
  vcn             => 'acceptance_tests/vcn_4',
  route_rules => [
    {
      'cidr_block' => '0.0.0.0/0',
      'destination' => '0.0.0.0/0',
      'destination_type' => 'CIDR_BLOCK',
      'network_entity_type' => 'internetgateway',
      'network_entity' => 'acceptance_tests/test_ig_2',
    }
  ],
}
