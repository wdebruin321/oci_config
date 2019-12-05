$tenant = 'enterprisemodules (root)'
$compartment_list = [
  "${tenant}/test",
  "${tenant}/test/instances"
]

oci_identity_compartment { $compartment_list:
  ensure      => 'absent',
  description => 'Managed by Puppet,'
}
