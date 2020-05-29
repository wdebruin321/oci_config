# The details cross connect mapping
type Oci_Config::CrossConnectMapping = Struct[{
  Optional[bgp_md5_auth_key]                        => String[1],
  Optional[cross_connect_or_cross_connect_group_id] => String[1],
  Optional[customer_bgp_peering_ip]                 => String[1],
  Optional[oracle_bgp_peering_ip]                   => String[1],
  Optional[customer_bgp_peering_ipv6]               => String[1],
  Optional[oracle_bgp_peering_ipv6]                 => String[1],
  Optional[vlan]                                    => Integer,
}]


