# The details of the user capabilities
type Oci_Config::UserCapabilities = Struct[{
  Optional[can_use_console_password]           => Boolean,
  Optional[can_use_api_keys]                   => Boolean,
  Optional[can_use_auth_tokens]                => Boolean,
  Optional[can_use_smtp_credentials]           => Boolean,
  Optional[can_use_customer_secret_keys]       => Boolean,
  Optional[can_use_o_auth2_client_credentials] => Boolean,
  Optional[can_use_db_credentials]             => Boolean,
}]
