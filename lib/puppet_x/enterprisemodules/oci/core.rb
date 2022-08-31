# frozen_string_literal: true

require_relative './monkey_patches/dir'

require 'pathname'
require 'etc'
$LOAD_PATH.unshift(File.absolute_path("#{__dir__}/../.."))
$LOAD_PATH.unshift(File.absolute_path("#{__dir__}/../../../../easy_type/lib"))

require 'easy_type'
require_relative './settings'
require_relative './type'
require_relative './property'
require_relative './config'
require_relative './name_resolver'
require_relative './resource_lister'
require_relative './model_additions'
require_relative './service_info'
require_relative './associated_property'
require_relative './associated_array_property'
require_relative './associated_hash_property'
#
# Require the ones missing in core.rb from the gem.
#
begin
  require 'oci/core/models/create_volume_backup_policy_details'
rescue LoadError
  # This version of the Gem doesn't have the volume backup policy.
end

require_relative './monkey_patches/hash'
require_relative './monkey_patches/string'
require_relative './monkey_patches/oci'
require_relative './monkey_patches/easy_type'
