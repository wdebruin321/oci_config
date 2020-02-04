oci_file_storage_export { 'enterprisemodules (root)/FileSystem-20200204-0935':
  ensure          => 'present',
  export_options  => [
  {
    'source' => '0.0.0.0/0',
    'require_privileged_source_port' => false,
    'access' => 'READ_WRITE',
    'identity_squash' => 'NONE',
    'anonymous_uid' => 65534,
    'anonymous_gid' => 65534
  }],
  file_system     => 'acceptance_tests/TheFileSystem',
  mount_target    => 'acceptance_tests/MountTarget-20200204-0931',
}
