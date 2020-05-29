# The details of the DHCP option
type Oci_Config::DhcpOption = Struct[{
  Optional['type']              => String[1],
  Optional[server_type]         => String[1],
  Optional[search_domain_names] => Array,
  Optional[custom_dns_servers]  => Array,
}]
