$volumes = [
  'enterprisemodules (root)/data_disk_1',
  'enterprisemodules (root)/data_disk_2',
]

oci_core_volume { $volumes :
  ensure              => 'present',
  availability_domain => 'arMl:EU-FRANKFURT-1-AD-1',
  is_hydrated         => true,
  size_in_gbs         => 512,
}

oci_core_instance { 'enterprisemodules (root)/bert2':
  ensure              => 'present',
  availability_domain => 'arMl:EU-FRANKFURT-1-AD-1',
  fault_domain        => 'FAULT-DOMAIN-2',
  launch_mode         => 'NATIVE',
  region              => 'eu-frankfurt-1',
  shape               => 'VM.Standard1.1',
  source_details      => {
    source_type => 'image',
    image_type  => 'image',
    image       => oci_config::latest_image_for('Oracle Linux', '7.7', /^((?!GPU).)*$/),
  },
  vnics               => {
    'nic1' => {
      # 'availability_domain' => 'arMl:EU-FRANKFURT-1-AD-1',
      'nic_index' => 0,
      # 'vlan_tag' => 1478,
      'hostname_label' => 'testhost2',
      'is_primary' => true,
      # 'mac_address' => '02:00:17:01:75:04',
      # 'private_ip' => '10.0.0.11',
      'skip_source_dest_check' => true,
      'subnet' => 'Public Subnet'
    }
  },
  volumes             => {
    'data_disk_1' => {
      'attachment_type' => 'paravirtualized',
      'device' => '/dev/oracleoci/oraclevdb',
      'display_name' => 'data_disk_1',
      'is_read_only' => true,
      # 'is_pv_encryption_in_transit_enabled' => false
    },
    'data_disk_2' => {
      'attachment_type' => 'paravirtualized',
      'device' => '/dev/oracleoci/oraclevdc',
      'display_name' => 'data_disk_2',
      'is_read_only' => true,
      # 'is_pv_encryption_in_transit_enabled' => false
    }
  },
}

