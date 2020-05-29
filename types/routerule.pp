# The details of the route rule
ype Oci_Config::RouteRule = Struct[{
  Optional[cidr_block]         => String[1],
  Optional[destination]         => String[1],
  Optional[destination_type]    => String[1],
  Optional[network_entity_id]   => String[1],
  Optional[network_entity]      => String[1],
  Optional[network_entity_type] => String[1],
}]
