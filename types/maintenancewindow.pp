type Oci_Config::MaintenanceWindow = Struct[{
  Optional[preference]     => String[1],
  Optional[months]         => Array[Oci_config::Month],
  Optional[weeks_of_month] => Array[Integer],
  Optional[days_of_week]   => Array[Oci_config::DayOfWeek],
  Optional[hours_of_day]   => Array[Integer],
}]
