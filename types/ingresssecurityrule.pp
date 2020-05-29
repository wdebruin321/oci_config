# The details of ingress security rule
type Oci_Config::IngressSecurityRule = Struct[{
  Optional[source_type]      => String[1],
  Optional[source]           => String[1],
  Optional[destination]      => String[1],
  Optional[destination_type] => String[1],
  Optional[icmp_options]     => Oci_config::IcmpOptions,
  Optional[is_stateless]     => Boolean,
  Optional[protocol]         => String[1],
  Optional[tcp_options]      => Oci_config::TcpOptions,
  Optional[udp_options]      => Oci_config::UdpOptions,
}]
