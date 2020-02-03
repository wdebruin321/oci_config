oci_core_instance_pool { 'enterprisemodules (root)/test':
  ensure                   => 'present',
  instance_configuration   => 'acceptance_tests/instanceconfig-20200203-0917',
  size                     => 0,
  placement_configurations => [
    availability_domain    => 'arMl:EU-FRANKFURT-1-AD-1',
    primary_subnet_type    => 'subnet',
    primary_subnet         => 'acceptance_tests/test',
  ],
freeform_tags => {'test' => 'nyes'},}
