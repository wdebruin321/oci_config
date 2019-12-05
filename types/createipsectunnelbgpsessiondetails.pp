type Oci_Config::CreateIPSecTunnelBgpSessionDetails = Struct[{
  Optional[oracle_interface_ip]   => String[1],
  Optional[customer_interface_ip] => String[1],
  Optional[customer_bgp_asn]      => String[1],
}]
