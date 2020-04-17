#
# Use this plan to correctly shutdown an OCI instance on OS level and then stop the instance on OCI level
#
plan oci_config::shutdown_instances(
  TargetSpec $instances,
  TargetSpec $oci_master        = 'localhost',
  String[1]  $shutdown_message  = 'Shutting down for cloud cost control',
  String[1]  $skip_label        = 'always_on',
  Integer    $wait_for_shutdown = 10,
) {
  if get_targets($oci_master).length > 1 {
    fail_plan("${oci_master} did not resolve to a single target")
  }

  $instance_nodes = get_targets($instances)

  $instance_nodes.each |$instance| {
    $hostname = $instance.host
    $node_facts = puppetdb_fact([$hostname])
    if $node_facts == {} {
      out::message("Skipping node ${instance.host} not found in Puppetdb.")
    } elsif $node_facts.dig($hostname, 'oci_instance_id') == nil {
      out::message("Skipping node ${instance.host} not an OCI node.")
    } else {
      $instance_id = $node_facts.dig($hostname, 'oci_instance_id')
      out::message("Execute regular shutdown on machine ${hostname}...")
      run_task('reboot', $instance, message => $shutdown_message, timeout => $wait_for_shutdown, shutdown_only => true)
      out::message("Execute shutdown on OCI-level for ${hostname} with ocid ${instance_id}...")
      run_task('oci_config::instance_action', $oci_master, instance_id => $instance_id, action => 'SOFTSTOP' )
    }
  }
}
