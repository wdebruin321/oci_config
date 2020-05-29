# The details of a Load Balancer attachment
type Oci_Config::AttachLoadBalancerDetails = Struct[{
  Optional[load_balancer_id] => String,
  Optional[load_balancer]    => String,
  Optional[backend_set_name] => String,
  Optional[port]             => Integer,
  Optional[vnic_selection]   => String,
}]


