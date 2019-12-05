# frozen_string_literal: true

#
# See the file "LICENSE" for the full license governing this code.
#
require 'easy_type'

Puppet::Type.type(:oci_identity_user_group_membership).provide(:sdk) do
  include EasyType::Provider
  mk_resource_methods
end
