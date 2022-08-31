type Oci_Config::PluggableDatabaseConnectionStrings = Struct[{
  Optional['pdb_default'] => String,
  Optional['pdb_ip_default'] => String,
  Optional['all_connection_strings'] => Hash[String, String],
}]
