# the standby options
type Oci_Config::AutonomousDatabaseStandbySummary= Struct[{
  Optional['lag_time_in_seconds'] => Integer,
  Optional['lifecycle_state']     => String,
  Optional['lifecycle_details']   => String,
}]
