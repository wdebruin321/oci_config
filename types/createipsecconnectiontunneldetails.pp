# The details of the IPSec connection tunnel
type Oci_Config::CreateIPSecConnectionTunnelDetails = Struct[{
  Optional[assign_public_ip]   => Boolean,
  Optional[display_name]       => String[1],
  Optional[routing]            => String[1],
  Optional[ike_version]        => String[1],
  Optional[shared_secret]      => String[1],
  Optional[bgp_session_config] => Oci_config::CreateIPSecTunnelBgpSessionDetails,
}]
