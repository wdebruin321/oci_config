#
# Use this plan to correctly shutdown an OCI instance on OS level and then stop the instance on OCI level
#
plan oci_config::start_instances(
  TargetSpec $instances,
  TargetSpec $oci_master        = 'localhost',
  String[1]  $skip_label        = 'always_off',
) {
  if get_targets($oci_master).length > 1 {
    fail_plan("${oci_master} did not resolve to a single target")
  }

  $instance_nodes = get_targets($instances)

  $instance_nodes.each |$instance| {
    $hostname = $instance.host
    $node_facts = puppetdb_fact([$hostname])
    if $node_facts == {} {
      warning("Skipping node ${instance.host} not found in Puppetdb.")
    } elsif $node_facts.dig($hostname, 'oci_instance_id') == undef {
      warning("Skipping node ${instance.host} not an OCI node.")
    } else {
      $instance_id = $node_facts.dig($hostname, 'oci_instance_id')
      notice("Execute startup on OCI-level for ${hostname} with ocid ${instance_id}...")
      run_task('oci_config::instance_action', $oci_master, instance_id => $instance_id, action => 'START' )
    }
  }
}
