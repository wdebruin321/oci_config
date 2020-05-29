# The details of the instance agent config
type Oci_Config::InstanceAgentConfig = Struct[{
  Optional[is_monitoring_supported] => Boolean,
  Optional[is_management_disabled]  => Boolean,
}]
