# The details of the image source
type Oci_Config::ImageSourceDetails = Struct[{
  Optional[operating_system]         => String[1],
  Optional[operating_system_version] => String[1],
  Optional[image_type]               => String[1],
  Optional[image]                    => String[1],
}]
