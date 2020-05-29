# The details of the UDP options
type Oci_Config::UdpOptions = Struct[{
  Optional[destination_port_range] => Oci_config::PortRange,
  Optional[source_port_range]      => Oci_config::PortRange,
}]
