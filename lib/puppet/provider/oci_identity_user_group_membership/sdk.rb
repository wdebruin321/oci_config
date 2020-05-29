# frozen_string_literal: true

#
# See the file "LICENSE" for the full license governing this code.
#
require 'easy_type'

Puppet::Type.type(:oci_identity_user_group_membership).provide(:sdk) do
  include EasyType::Provider
  desc <<-DESC

  This provider uses the [Oracle Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk) to do its work.

  DESC
  mk_resource_methods
end
