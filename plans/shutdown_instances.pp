#
# See the file "LICENSE" for the full license governing this code.
#
#++--++
#
# @summary Use this plan to correctly shutdown an OCI instance on OS level 
#          and then stop the instance on OCI level. This is usefull for making
#
# @example
#   bolt plan run oci_config::shutdowm_instances oci_master=mypupptserver instances=mynode1,mynode2,mynode3
#
# @param [TargetSpec] oci_master
#   The Puppetserver that has the oci_config module installed and has one or more
#   oci_tenant instances defined on it.
#
# @param [TargetSpec] instances
#   The OCI instance names you want to shutdown
#
# @param [String[1]] shutdown_message
#   The shutdown message to display on the specified node
#
# @param [Integer] after
#   The time in seconds to wait before actually start the shutdown.
#
# @param [Integer] wait_time
#   The time in seconds to wait for the system to be shutdown. After this
#   wait time is exceded and the system is still not down, continue processing.
#
# @param [Integer] retry_interval
#   The retry interval between checks if the system is really down.
#
#--++--
#
# 
#
plan oci_config::shutdown_instances(
  TargetSpec $instances,
  TargetSpec $oci_master        = 'localhost',
  String[1]  $shutdown_message  = 'Shutting down for cloud cost control',
  Integer    $after             = 10,
  Integer    $wait_time         = 180,
  Integer    $retry_interval    = 10,
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
      notice("Execute regular shutdown on machine ${hostname}...")

      #
      # Initiate the OS schutdown on the system
      #
      without_default_logging() || {
        #
        # The reboot tasks gives people the impression that it is a reboot
        # So that's why we're running without_default_logging
        #
        run_task('reboot', $instance,
          message       => $shutdown_message,
          timeout       => $after,
          shutdown_only => true,
          _catch_errors  => true)
      }
      #
      # We might want to wait until the OS shtdown is complete
      # before swithcing off the machine
      #
      if $wait_time > 0 {
        notice("Waiting for shutdown to complete on ${hostname}...")
        oci_config::wait_until_unavailable($hostname,
          wait_time      => $wait_time,
          retry_interval => $retry_interval,
          _catch_errors  => true)
      } else {
        notice("Skipped waiting for shutdown to complete on ${hostname}...")
      }
      #
      # Now do the OCI shutdown
      #
      notice("Execute shutdown on OCI-level for ${hostname} with ocid ${instance_id}...")
      run_task('oci_config::instance_action',
        $oci_master,
        instance_id => $instance_id,
        action => 'SOFTSTOP' )
    }
  }
}
