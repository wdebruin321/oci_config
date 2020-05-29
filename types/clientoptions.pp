# The details of the client options
type Oci_Config::ClientOptions= Struct[{
  Optional[source]                         => String,
  Optional[require_privileged_source_port] => Boolean,
  Optional[access]                         => String,
  Optional[identity_squash]                => String,
  Optional[anonymous_uid]                  => Integer,
  Optional[anonymous_gid]                  => Integer,
}]





