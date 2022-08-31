type Oci_Config::InstancePoolInstanceLoadBalancerBackend = Struct[{
  Optional[name]       => String,
  Optional[ip_address] => String,
  Optional[target_id]  => String,
  Optional[port]       => Integer,
  Optional[weight]     => Integer,
  Optional[is_drain]   => Boolean,
  Optional[is_backup]  => Boolean,
  Optional[is_offline] => Boolean,
}]
