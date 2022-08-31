type Oci_Config::DatabaseConnectionStrings = Struct[{
  Optional['high'] => String,
  Optional['medium'] => String,
  Optional['low'] => String,
  Optional['dedicated'] => String,
  Optional['all_connection_strings'] => Hash[String, String],
  Optional['profiles'] => Array[Oci_config::DatabaseConnectionStringProfile],
}]
