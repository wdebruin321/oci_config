# The details of the launch options
type Oci_Config::LaunchOptions = Struct[{
  Optional[boot_volume_type]                    => String[1],
  Optional[firmware]                            => String[1],
  Optional[network_type]                        => String[1],
  Optional[remote_data_volume_type]             => String[1],
  Optional[is_pv_encryption_in_transit_enabled] => Boolean,
  Optional[is_consistent_volume_naming_enabled] => Boolean,
}]
