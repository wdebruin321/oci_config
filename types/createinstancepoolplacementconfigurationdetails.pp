# The details of the instance pool placement configuration
type Oci_Config::CreateInstancePoolPlacementConfigurationDetails = Struct[{
  Optional[availability_domain] => String,
  Optional[primary_subnet_type] => String,
  Optional[primary_subnet_id]   => String,
  Optional[primary_subnet]      => String,
  # Optional[secondary_vnic_subnets] => Array[Oci_config::InstancePoolPlacementSecondaryVnicSubnet]
}]


