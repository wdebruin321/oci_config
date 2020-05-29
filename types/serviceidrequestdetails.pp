# The details of the service id request
type Oci_Config::ServiceIdRequestDetails = Struct[{
  Optional[service_id]   => String[1],
  Optional[service]      => String[1],
  Optional[service_name] => String[1],
  Optional[service_type] => String[1],
}]
