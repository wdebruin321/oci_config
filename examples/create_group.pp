
oci_identity_group { 'enterprisemodules (root)/LocalUsers':
  ensure          => 'present',
  description     => 'Local Users',
  users           => ['test_user_1','test_user_2'],
}

oci_identity_user { 'enterprisemodules (root)/test_user_1':
  ensure          => 'present',
  description     => 'test user',
}

oci_identity_user { 'enterprisemodules (root)/test_user_2':
  ensure          => 'present',
  description     => 'test user',
}
