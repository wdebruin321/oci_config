# The details of the launch instance agent config
type Oci_Config::LaunchInstanceAgentConfigDetails = Struct[{
  Optional[is_monitoring_disabled] => Boolean,
  Optional[is_management_disabled] => Boolean,
}]
