oci_file_storage_mount_target { 'enterprisemodules (root)/acceptance_tests/MountTarget-20200204-0932':
  ensure              => 'present',
  availability_domain => 'arMl:EU-FRANKFURT-1-AD-1',
  subnet              => 'acceptance_tests/test',
}
