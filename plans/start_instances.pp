#
# See the file "LICENSE" for the full license governing this code.
#
#++--++
#
# @summary This plan will start the specified OCI instances
#
# @example
#   bolt plan run oci_config::start_instances oci_master=mypupptserver instances=mynode1,mynode2,mynode3
#
# @param [TargetSpec] oci_master
#   The Puppetserver that has the oci_config module installed and has one or more
#   oci_tenant instances defined on it.
#
# @param [TargetSpec] instances
#   The OCI instanc names you want to start
#
#--++--
plan oci_config::start_instances(
  TargetSpec $instances,
  TargetSpec $oci_master        = 'localhost',
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
      run_task('oci_config::instance_action', $oci_master,
        instance_id => $instance_id,
        action => 'START' )
    }
  }
}
