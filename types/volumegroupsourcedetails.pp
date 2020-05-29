# The details of the volume group source
type Oci_Config::VolumeGroupSourceDetails = Struct[{
  Optional['type']                 => String[1],
  Optional[volume_group_backup_id] => String[1],
  Optional[volume_group_backup]    => String[1],
  Optional[volume_ids]             => Array[String[1]],
  Optional[volumes]                => Array[String[1]],
}]
