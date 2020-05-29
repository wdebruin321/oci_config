# The details of the instance source
type Oci_Config::InstanceSourceDetails = Struct[{
  source_type           => String[1],
  Optional[image_id]    => String[1],
  Optional[image]       => String[1],
  Optional[image_type]  => String[1],
}]
