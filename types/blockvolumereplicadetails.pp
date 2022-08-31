type Oci_Config::BlockVolumeReplicaDetails = Struct[{
  Optional['availability_domain']           => String,
  Optional['compartment_id']                => String,
  Optional['defined_tags']                  => Hash[String, Hash[String, Object]],
  Optional['display_name']                  => String,
  Optional['freeform_tags']                 => Hash[String, String],
  Optional['id']                            => String,
  Optional['lifecycle_state']               => String,
  Optional['size_in_gbs']                   => Integer,
  Optional['time_created']                  => DateTime,
  Optional['time_last_synced']              => DateTime,
  Optional['block_volume_id']               => String,
  Optional['total_data_transferred_in_gbs'] => Integer,
  Optional['volume_group_replica_id']       => String
}]
