type Oci_Config::LaunchInstancePlatformConfig = Struct[{
  Optional['type'] => String[1],
  Optional[is_secure_boot_enabled] => Boolean,
  Optional[is_trusted_platform_module_enabled] => Boolean,
  Optional[is_measured_boot_enabled] => Boolean
}]
