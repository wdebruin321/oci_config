# frozen_string_literal: true

#
# See the file "LICENSE" for the full license governing this code.
#
newproperty(:users, :array_matching => :all, :parent => Puppet_X::EnterpriseModules::Oci::AssociatedArrayProperty) do
  desc <<-DESC
  The list of users that are part of this group. An exapmple on how to use this:

      oci_identity_group { 'tenant (root)/my_group':
        ensure => 'present',
        users  => ['my_user']
      }

  DESC
  data_type('Array[String[1]]')

  association :user_group_membership => { :from => :group_id, :to => :user_id, :model => OCI::Identity::Models::AddUserToGroupDetails, :remove => :remove_user_from_group, :add => :add_user_to_group }
end

child_of(:user_id) { users&.collect { |u| "#{tenant_string}/#{u}" } }
