# The details of an autonomous Database connection url
type Oci_Config::AutonomousDatabaseConnectionUrls = Struct[{
  Optional['sql_dev_web_url']                      => String[1],
  Optional['apex_url']                             => String[1],
  Optional['machine_learning_user_management_url'] => String[1],
}]
