oci_file_storage_file_system { 'enterprisemodules (root)/acceptance_tests/TheFileSystem_2':
  ensure              => 'present',
  availability_domain => 'arMl:EU-FRANKFURT-1-AD-1',
  freeform_tags       => {'test' => 'yno'},
}
