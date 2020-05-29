# The details of the IPSec tunnel BGP session
type Oci_Config::CreateIPSecTunnelBgpSessionDetails = Struct[{
  Optional[oracle_interface_ip]   => String[1],
  Optional[customer_interface_ip] => String[1],
  Optional[customer_bgp_asn]      => String[1],
}]
