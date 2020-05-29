# The details of a boot volume source
type Oci_Config::BootVolumeSourceDetails = Struct[{
  Optional['type'] => String[1],
  Optional[id]     => String[1],
  Optional[name]   => String[1],
}]
