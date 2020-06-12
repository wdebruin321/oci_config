type Oci_Config::DatabaseConnectionStrings = Struct[{
  Optional[cdb_default]            => String[1],
  Optional[cdb_ip_default]         => String[1],
  Optional[all_connection_strings] => Hash[String, String],
}]
