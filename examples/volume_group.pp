oci_core_volume_group { 'enterprisemodules (root)/bbb':
  ensure              => 'present',
  availability_domain => 'arMl:EU-FRANKFURT-1-AD-1',
  source_details      => {
    'type' => 'volumeIds',
    'volumes' => ['small_one']
  },
}


