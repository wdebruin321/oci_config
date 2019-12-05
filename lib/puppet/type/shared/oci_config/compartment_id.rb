# frozen_string_literal: true

#
# See the file "LICENSE" for the full license governing this code.
#
newproperty(:compartment_id, :parent => Puppet_X::EnterpriseModules::Oci::Property) do
  desc <<-DESC
  The OCID of the compartment that contains the object.

  Rather use the property `compartment` instead of a direct OCID reference.

  This documentation is generated from the Ruby OCI SDK.
  DESC
  data_type('Optional[String[1]]')
end
