type Oci_Config::DbBackupConfig = Struct[{
  Optional[auto_backup_enabled]        => Boolean,
  Optional[recovery_window_in_days]    => Integer,
  Optional[auto_backup_window]         => String[1],
  Optional[backup_destination_details] => Array[Oci_config::BackupDestinationDetails],
}]
