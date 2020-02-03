oci_autoscaling_auto_scaling_configuration { 'enterprisemodules (root)/acceptance_tests/autoscaling-config-20200203-1159-1':
  ensure               => 'present',
  cool_down_in_seconds => 300,
  is_enabled           => true,
  instance_pool        => 'acceptance_tests/test_pool_ks3llgg29ma3',
  policies             => [],
}
