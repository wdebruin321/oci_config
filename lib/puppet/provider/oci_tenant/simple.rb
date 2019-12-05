# frozen_string_literal: true

#
# See the file "LICENSE" for the full license governing this code.
#
Puppet::Type.type(:oci_tenant).provide(:simple) do
  include EasyType::Provider

  desc 'Manage oci tenant through yaml file'
  mk_resource_methods
end
