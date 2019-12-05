# frozen_string_literal: true

#
# See the file "LICENSE" for the full license governing this code.
#
newproperty(:id, :parent => Puppet_X::EnterpriseModules::Oci::Property) do
  desc <<-DESC
  The OCID of the resource. This is a read-only property.

  This documentation is generated from the Ruby OCI SDK.
  DESC

  # rubocop: disable Naming/MethodParameterName
  def insync?(is)
    fail 'id is a read-only property. You cannot change it.' if is != should
  end
  # rubocop: enable Naming/MethodParameterName

  data_type('Optional[String[1]]')
end
