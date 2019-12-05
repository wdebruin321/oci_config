oci_core_dhcp_options { 'enterprisemodules (root)/test2':
  ensure          => 'present',
  options         => [
  {
    'type' => 'DomainNameServer',
    'custom_dns_servers' => [],
    'server_type' => 'VcnLocalPlusInternet'
  },
  {
    'type' => 'SearchDomain',
    'search_domain_names' => ['vvcn.oraclevcn.com']
  }],
  vcn             => 'VirtualCloudNetwork-20200103-0949',
}
