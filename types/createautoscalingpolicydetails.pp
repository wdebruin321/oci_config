# The details of the auto scaling policy
type Oci_Config::CreateAutoScalingPolicyDetails = Struct[{
  Optional[capacity]     => Oci_config::Capacity,
  Optional[display_name] => String,
  Optional[policy_type]  => String,
  Optional[rules]        => Array[Any],
}]
