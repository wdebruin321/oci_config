History
========

## 0.2.0

- [tasks/*_block_volume_backup] refactered code and added task to delete block_volume backups
- [tasks/create_block_volume_backup] Initial implementation
- [core] Let resolver accept full names
- [oci_file_storage_*] Initial implementation
- [oci_file_storage_mount_target] Initial implementation
- [oci_file_storage_file_system] Initial implementation
- [oci_object_storage_bucket] Initial implementation
- [oci_core_instance_configuration] Initial implementation
- [oci_autoscaling_auto_scaling_configuration] Initial implementation
- [oci_core_instance_pool] initial implementation
- [core] Confine facts to an existing oci_tenant definition
- [oci_database_autonomous_database] Add fact
- [facts] Initial version of oci_core_public_ip
- [facts] Add support for listing OCI information as fact
- [oci_core_public_ip] Initial implementation
- [core] Remove deprecated properties from puppet types
- [generator] Add support for skipping deprecated properties
- [oci_tenant] Add autorequire and some documentation
- [oci_key_management_*] Add support for destroying and creating vaults and keys
- [core] Fix autorequire for ensure=present
- [key_management] Add types for oci_key_management_vault and oci_key_management_key
- [core] Fix error when resource references an unknown ocid

## 0.1.1

- [core] We need the data in the module

## 0.1.0

- initial release
