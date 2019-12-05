# frozen_string_literal: true

def before_destroy
  memberships = client.list_user_group_memberships(provider.compartment_id, :user_id => provider.id).data
  Puppet.debug "Removing user #{name} from groups"
  memberships.each { |m| handle_oci_request(:groupmembership, false) { client.remove_user_from_group(m.id) } }
end
