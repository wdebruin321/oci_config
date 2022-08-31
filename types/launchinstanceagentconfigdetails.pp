# The details of the launch instance agent config
type Oci_Config::LaunchInstanceAgentConfigDetails = Struct[{
  Optional[is_monitoring_disabled] => Boolean,
  Optional[is_management_disabled] => Boolean,
  Optional[are_all_plugins_disabled] => Boolean,
  Optional[plugins_config] => Oci_config::InstanceAgentPluginConfigDetails,
}]
