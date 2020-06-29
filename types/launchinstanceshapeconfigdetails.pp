# The details of the launch instance Shape config
type Oci_Config::LaunchInstanceShapeConfigDetails = Struct[{
  Optional[ocpus]                         => Float,
  Optional[memory_in_gbs]                 => Float,
  Optional[processor_description]         => String[1],
  Optional[networking_bandwidth_in_gbps]  => Float,
  Optional[max_vnic_attachments]          => Integer,
  Optional[gpus]                          => Integer,
  Optional[gpu_description]               => String[1],
  Optional[local_disks]                   => Integer,
  Optional[local_disks_total_size_in_gbs] => Float,
  Optional[local_disk_description]        => String[1],
}]
