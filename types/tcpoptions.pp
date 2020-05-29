# The details of the TCP options
type Oci_Config::TcpOptions = Struct[{
  Optional[destination_port_range] => Oci_config::PortRange,
  Optional[source_port_range]      => Oci_config::PortRange,
}]
