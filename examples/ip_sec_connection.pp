oci_core_cpe { 'enterprisemodules (root)/acceptance_tests/test_cpe_1':
  ensure          => 'present',
  ip_address      =>'10.0.0.1',
}
oci_core_drg { 'enterprisemodules (root)/acceptance_tests/test_drg_1':
  ensure          => 'present',
}
oci_core_ip_sec_connection { 'enterprisemodules (root)/acceptance_tests/test_ip_sec_connection_1':
  ensure                    => 'present',
  freeform_tags             => {'test' => 'no'},
  drg                       => 'acceptance_tests/test_drg_1',
  cpe                       => 'acceptance_tests/test_cpe_1',
  cpe_local_identifier      => '10.0.0.1',
  cpe_local_identifier_type => 'IP_ADDRESS',
  static_routes             => ['10.0.0.0/16'],
}
