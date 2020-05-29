# The details of the volume backup schedule
type Oci_Config::VolumeBackupSchedule = Struct[{
  Optional[backup_type]       => String[1],
  Optional[offset_seconds]    => Integer,
  Optional[period]            => String[1],
  Optional[offset_type]       => String[1],
  Optional[hour_of_day]       => Integer,
  Optional[day_of_week]       => String[1],
  Optional[day_of_month]      => Integer,
  Optional[month]             => String[1],
  Optional[retention_seconds] => Integer,
  Optional[time_zone]         => String[1],
}]
