# frozen_string_literal: true

#
# See the file "LICENSE" for the full license governing this code.
#
require "#{File.dirname(__FILE__)}/../puppet_x/enterprisemodules/oci/define_fact"

oci_define_fact(:oci_core_public_ip, %w[ip_address time_created])
