History
========

## 0.11.3

- [core] Use our own oci 2.10.1 gem
- [oci_core_instance] Don’t camel case extended_metadata
- [oci_core_instance] user_data needs struct base64 encoding to work

## 0.11.2

- [oci_identity_tag_defaults] Fix idempotency issues
- [oci_core_instance] Fix handling of ssh-authorized-keys & user_data

## 0.11.1

- [core] Fix casing issue on metadata

## 0.11.0

- [oci_identity_tag_default] Initial implementation
- [oci_identity_tag] Initial implementation
- [core] Add basic support for tag namespaces and tag definitions
- [facts] Fix long waiting times for fetching oci client facts
- [core] Update to gem 2.10.0

## 0.10.1

- [core] Handle casing for resource types

## 0.10.0

- [core] Fix fetching when referencing unknown or terminated resources
- [core] Pass tag keys and values unaltered to OCI
- [core] Fix undefined method `status_code' for #<OCI::Errors::NetworkError:>
- [wait_until_unavailable] Stop sending analytics for oci_config::wait_until_unavaliable to bolt/puppet
- [core] Update to SDK 2.9.0
- [oci_database_database] Initial implementation (experimental)

## 0.9.0

- [oci_database_db_system] Initial implementation (experimental)
- [oci_database_autonomous_database] fix error unrecognized key 'machine_learning_user_management_url'
- [core] Fix warning: previous definition of xxx was here
- [oci_task] Fix error when invalid tenant format is used

## 0.8.2

- [core] Fix typo in router rule

## 0.8.1

- [doc] Add REFERENCE.md

## 0.8.0

- [oci_core_instance] Fix detection of used devices
- [core] Don’t used destroyed resources for name resolving
- [core] Make OCI retry settings configurable through oci_tenant

## 0.7.0

- [oci_config] Add class for easy gem installation
- [oci_core_instance] Add support for helper properties user_data & ssh_authorized_keys
- [core] Add support for instance pricipals

## 0.6.0

- [core] Extract the selection of present resource from the resource lister
- [tasks/database_action] Initial implementation
- [core] Add basic support for resolving dbnodes
- [oci_core_instance] Add default devices for attachments
- [oci_core_instance] Add support for attached_volumes and detached_volumes
- [oci_core_instance] Fix update on volumes
- [oci_core_volume] Fix vpus_per_gb property
- [oci_core_volume] Fix property backup_policy
- [facts] Use monkey patched Dir to bypass error expanding ‘~’

## 0.5.1

- [core] Handle references to properties that we don’t have acces to
- [core] Optimize name fetching for cache
- [core] Make all resource listers handle autorisation failure

## 0.5.0

- [oci_file_storage_export] Fix prefetching for this resource
- [core] skip prefetching in unkown compartments
- [core] Work arround for OCI pagination
- [core] skip over unautorised compartments
- [core] Add prefetching to speed up on large tenants

## 0.4.0

- [core] Update all types to gem 2.8.0 definition
- [core] Fix handling id’s in hash properties

## 0.3.0

- [oci_core_instance] Add key is_management_disabled to agent_config
- [core] Monkey patch implementation of Dir.home
- [oci_core_instance] Fix agent config when used with 2.8.0 gem
- [oci_identity_user] Fix user capabilities when used with 2.8.0 gem
- [functions] Add initial implementation of wait_until_unavailable
- [plans] Use Puppet messages instead out out::message
- [facts] Skip OCI facts when no oci gem installed
- [plan/start_instance] Initial implementation
- [plan/shutdown_instances] Fix check for oci node
- [facts] Add posibility to skip facts
- [facts] Handle authorization failure on facts gracefull
- [core] Speed up API retries
- [core] Handle authorization failure on properties gracefull
- [core] Move settings into oci part to bypass naming conflicts with other modules
- [core] Add support for proxy servers
- [oci_tenant] Add proxy properties
- [plans/shutdown_instances] Initial implementation
- [core] Make name resolver operate in less secure accounts
- [oci_client_facts] Fix when used outside of oci
- [tasks/instance_action] Initial implementation
- [core] Add support for default tenants
- [oci_client_facts] Fix settings and config reguire
- [client_facts] Add oci_defined_tags and oci_freeform_tags as first class facts
- [client_facts] Add fact oci_instance_id
- [facts] Add fact oci_core_image and function latest_image_for to use it with ease
- [oci_core_instance_configuration] Use detailed get_ method
- [core] Make data type check less restrictive for Strings
- [core] Fix data_type of defined_tags
- [oci_core_service_gateway] Fix lookup of service_id’s

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
