# The details of VNIC
type Oci_Config::CreateVnicDetails = Struct[{
  Optional[assign_public_ip]       => Boolean,
  Optional[defined_tags]           => Hash[String[1],String[1]],
  Optional[display_name]           => String[1],
  Optional[freeform_tags]          => Hash[String[1],String[1]],
  Optional[hostname_label]         => String[1],
  Optional[nsg_ids]                => String[1],
  Optional[nsg]                    => String[1],
  Optional[private_ip]             => String[1],
  Optional[skip_source_dest_check] => Boolean,
  Optional[subnet_id]              => String[1],
  Optional[subnet]                 => String[1]
}]
