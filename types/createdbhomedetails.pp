type Oci_Config::CreateDbHomeDetails = Struct[{
  Optional[display_name] => String[1],
  Optional[db_version] => String[1],
  Optional[database] => Oci_ConfigCreateDatabaseDetails,
}]
