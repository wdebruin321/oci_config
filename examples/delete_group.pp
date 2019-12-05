# oci_identity_group { 'enterprisemodules (root)/LocalUsers':
#   ensure          => 'absent',
# }

oci_identity_user { 'enterprisemodules (root)/test_user_1':
  ensure          => 'absent',
}
