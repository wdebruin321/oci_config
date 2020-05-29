# The details of the key shape
type Oci_Config::KeyShape = Struct[{
  Optional[algorithm] => String[1],
  Optional[length]    => Integer,
}]


