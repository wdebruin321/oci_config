# frozen_string_literal: true

require 'bolt/util'

class TimeoutError < RuntimeError; end

# Wait until all targets no longer accept connections.
#
# > **Note:** Not available in apply block
Puppet::Functions.create_function('oci_config::wait_until_unavailable') do
  # Wait until targets are available.
  # @param targets A pattern identifying zero or more targets. See {get_targets} for accepted patterns.
  # @param options A hash of additional options.
  # @option options [String] description A description for logging. (default: 'wait until no longer available')
  # @option options [Numeric] wait_time The time to wait. (default: 120)
  # @option options [Numeric] retry_interval The interval to wait before retrying. (default: 1)
  # @option options [Boolean] _catch_errors Whether to catch raised errors.
  # @return A list of results, one entry per target. Successful results have no value.
  # @example Wait for targets
  #   wait_until_unavailable($targets, wait_time => 300)
  dispatch :wait_until_unavailable do
    param 'Boltlib::TargetSpec', :targets
    optional_param 'Hash[String[1], Any]', :options
    return_type 'ResultSet'
  end
  def wait_until_unavailable(targets, options = nil)
    unless Puppet[:tasks]
      raise Puppet::ParseErrorWithIssue.
        from_issue_and_stack(Bolt::PAL::Issues::PLAN_OPERATION_NOT_SUPPORTED_WHEN_COMPILING,
                             :action => 'wait_until_unavailable')
    end

    options ||= {}
    executor = Puppet.lookup(:bolt_executor)
    inventory = Puppet.lookup(:bolt_inventory)

    # Ensure that given targets are all Target instances
    targets = inventory.get_targets(targets)

    if targets.empty?
      call_function('debug', 'Simulating wait_until_unavailable - no targets given')
      Bolt::ResultSet.new([])
    else
      wait_time = options['wait_time'].to_i || 120
      description = options['description'] || 'wait until no longer available'
      retry_interval = options['retry_interval'].to_i || 10
      executor.log_action(description, targets) do
        executor.batch_execute(targets) do |transport, batch|
          executor.with_node_logging('Checking availability', batch) do
            executor.wait_until(wait_time, retry_interval) { !transport.batch_connected?(batch) }
            batch.map { |target| Bolt::Result.new(target, :action => 'wait_until_unavailable', :object => description) }
          rescue TimeoutError => e
            available, unavailable = batch.partition { |target| !transport.batch_connected?([target]) }
            (
              available.map { |target| Bolt::Result.new(target, :action => 'wait_until_unavailable', :object => description) } +
              unavailable.map { |target| Bolt::Result.from_exception(target, e, :action => 'wait_until_unavailable') }
            )
          end
        end
      end
    end
  end
end
