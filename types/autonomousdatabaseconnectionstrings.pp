# The details of an autonomous Database connection String
type Oci_Config::AutonomousDatabaseConnectionStrings = Struct[{
  Optional[high]                   => String[1],
  Optional[medium]                 => String[1],
  Optional[low]                    => String[1],
  Optional[dedicated]              => String[1],
  Optional[all_connection_strings] => Hash[String, String],
}]
