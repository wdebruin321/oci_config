---
title: oci database db system
keywords: documentation
layout: documentation
sidebar: oci_config_sidebar
toc: false
---
## Overview

DbSystem model.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).

## Attributes



Attribute Name                                                                             | Short Description                                                                                                                                                                         |
------------------------------------------------------------------------------------------ | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
[absent_states](#oci_database_db_system_absent_states)                                     | The OCI states, puppet will detect as the resource being absent.                                                                                                                          |
[availability_domain](#oci_database_db_system_availability_domain)                         | The name of the availability domain that the DB system is located in.                                                                                                                     |
[backup_network_nsg_ids](#oci_database_db_system_backup_network_nsg_ids)                   | A list of the [OCIDs](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the network security groups (NSGs) that the backup network of this DB system belongs to. |
[backup_network_nsgs](#oci_database_db_system_backup_network_nsgs)                         | The Puppet name of the resource identified by `backup_network_nsg_ids`.                                                                                                                   |
[backup_subnet](#oci_database_db_system_backup_subnet)                                     | The Puppet name of the resource identified by `backup_subnet_id`.                                                                                                                         |
[backup_subnet_id](#oci_database_db_system_backup_subnet_id)                               |   The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the backup network subnet the DB system is associated with.                                       |
[cluster_name](#oci_database_db_system_cluster_name)                                       | The cluster name for Exadata and 2-node RAC virtual machine DB systems.                                                                                                                   |
[compartment](#oci_database_db_system_compartment)                                         | The Puppet name of the resource identified by `compartment_id`.                                                                                                                           |
[compartment_id](#oci_database_db_system_compartment_id)                                   | The OCID of the compartment that contains the object.                                                                                                                                     |
[cpu_core_count](#oci_database_db_system_cpu_core_count)                                   | The number of CPU cores enabled on the DB system.                                                                                                                                         |
[data_storage_percentage](#oci_database_db_system_data_storage_percentage)                 |   The percentage assigned to DATA storage (user data and database files).                                                                                                                 |
[data_storage_size_in_gbs](#oci_database_db_system_data_storage_size_in_gbs)               | The data storage size, in gigabytes, that is currently available to the DB system.                                                                                                        |
[database_edition](#oci_database_db_system_database_edition)                               |   The Oracle Database Edition that applies to all the databases on the DB system.                                                                                                         |
[db_home](#oci_database_db_system_db_home)                                                 | This attribute is required.                                                                                                                                                               |
[db_system_name](#oci_database_db_system_db_system_name)                                   | The name of the db_system.                                                                                                                                                                |
[db_system_options](#oci_database_db_system_db_system_options)                             | 
                                                                                                                                                                                         |
[defined_tags](#oci_database_db_system_defined_tags)                                       |   Defined tags for this resource.                                                                                                                                                         |
[disable_corrective_change](#oci_database_db_system_disable_corrective_change)             | Disable the modification of a resource when Puppet decides it is a corrective change.                                                                                                     |
[disable_corrective_ensure](#oci_database_db_system_disable_corrective_ensure)             | Disable the creation or removal of a resource when Puppet decides is a corrective change.                                                                                                 |
[disk_redundancy](#oci_database_db_system_disk_redundancy)                                 |   The type of redundancy configured for the DB system.                                                                                                                                    |
[domain](#oci_database_db_system_domain)                                                   | The domain name for the DB system.                                                                                                                                                        |
[ensure](#oci_database_db_system_ensure)                                                   | The basic property that the resource should be in.                                                                                                                                        |
[fault_domains](#oci_database_db_system_fault_domains)                                     | List of the Fault Domains in which this DB system is provisioned.                                                                                                                         |
[freeform_tags](#oci_database_db_system_freeform_tags)                                     |   Free-form tags for this resource.                                                                                                                                                       |
[hostname](#oci_database_db_system_hostname)                                               | The hostname for the DB system.                                                                                                                                                           |
[id](#oci_database_db_system_id)                                                           | The OCID of the resource.                                                                                                                                                                 |
[initial_data_storage_size_in_gb](#oci_database_db_system_initial_data_storage_size_in_gb) | 
                                                                                                                                                                                         |
[iorm_config_cache](#oci_database_db_system_iorm_config_cache)                             | 
                                                                                                                                                                                         |
[last_patch_history_entry](#oci_database_db_system_last_patch_history_entry)               | The Puppet name of the resource identified by `last_patch_history_entry_id`.                                                                                                              |
[last_patch_history_entry_id](#oci_database_db_system_last_patch_history_entry_id)         | The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the last patch history.                                                                             |
[license_model](#oci_database_db_system_license_model)                                     | The Oracle license model that applies to all the databases on the DB system.                                                                                                              |
[lifecycle_state](#oci_database_db_system_lifecycle_state)                                 | The current state of the DB system.                                                                                                                                                       |
[listener_port](#oci_database_db_system_listener_port)                                     | The port number configured for the listener on the DB system.                                                                                                                             |
[name](#oci_database_db_system_name)                                                       | The full name of the object.                                                                                                                                                              |
[node_count](#oci_database_db_system_node_count)                                           | The number of nodes in the DB system.                                                                                                                                                     |
[nsg_ids](#oci_database_db_system_nsg_ids)                                                 |   A list of the [OCIDs](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the network security groups (NSGs) that this resource belongs to.                      |
[nsgs](#oci_database_db_system_nsgs)                                                       | The Puppet name of the resource identified by `nsg_ids`.                                                                                                                                  |
[oci_timeout](#oci_database_db_system_oci_timeout)                                         | The maximum time to wait for the OCI resource to be in the ready state.                                                                                                                   |
[oci_wait_interval](#oci_database_db_system_oci_wait_interval)                             | The interval beween calls to OCI to check if a resource is in the ready state.                                                                                                            |
[present_states](#oci_database_db_system_present_states)                                   | The OCI states, puppet will detect as the resource being present.                                                                                                                         |
[provider](#oci_database_db_system_provider)                                               | resource.                                                                                                                                                                                 |
[reco_storage_size_in_gb](#oci_database_db_system_reco_storage_size_in_gb)                 | The RECO/REDO storage size, in gigabytes, that is currently allocated to the DB system.                                                                                                   |
[scan_dns_record](#oci_database_db_system_scan_dns_record)                                 | The Puppet name of the resource identified by `scan_dns_record_id`.                                                                                                                       |
[scan_dns_record_id](#oci_database_db_system_scan_dns_record_id)                           | The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the DNS record for the SCAN IP addresses that are associated with the DB system.                    |
[scan_ip_ids](#oci_database_db_system_scan_ip_ids)                                         |   The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Single Client Access Name (SCAN) IP addresses associated with the DB system.                  |
[scan_ips](#oci_database_db_system_scan_ips)                                               | The Puppet name of the resource identified by `scan_ip_ids`.                                                                                                                              |
[shape](#oci_database_db_system_shape)                                                     |   The shape of the DB system.                                                                                                                                                             |
[source](#oci_database_db_system_source)                                                   | 
                                                                                                                                                                                         |
[sparse_diskgroup](#oci_database_db_system_sparse_diskgroup)                               | True, if Sparse Diskgroup is configured for Exadata dbsystem, False, if Sparse diskgroup was not configured.                                                                              |
[ssh_public_keys](#oci_database_db_system_ssh_public_keys)                                 | The public key portion of one or more key pairs used for SSH access to the DB system.                                                                                                     |
[subnet](#oci_database_db_system_subnet)                                                   | The Puppet name of the resource identified by `subnet_id`.                                                                                                                                |
[subnet_id](#oci_database_db_system_subnet_id)                                             |   The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the subnet the DB system is associated with.                                                      |
[synchronized](#oci_database_db_system_synchronized)                                       | Specifies if Puppet waits for OCI actions to be ready before moving on to an other resource.                                                                                              |
[tenant](#oci_database_db_system_tenant)                                                   | The tenant for this resource.                                                                                                                                                             |
[time_created](#oci_database_db_system_time_created)                                       | The date and time the DB system was created.                                                                                                                                              |
[time_zone](#oci_database_db_system_time_zone)                                             | The time zone of the DB system.                                                                                                                                                           |
[version](#oci_database_db_system_version)                                                 | The Oracle Database version of the DB system.                                                                                                                                             |
[vip_ids](#oci_database_db_system_vip_ids)                                                 |   The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the virtual IP (VIP) addresses associated with the DB system.                                     |
[vips](#oci_database_db_system_vips)                                                       | The Puppet name of the resource identified by `vip_ids`.                                                                                                                                  |




### absent_states<a name='oci_database_db_system_absent_states'>

The OCI states, puppet will detect as the resource being absent.



[Back to overview of oci_database_db_system](#attributes)

### availability_domain<a name='oci_database_db_system_availability_domain'>

The name of the availability domain that the DB system is located in.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_database_db_system](#attributes)

### backup_network_nsg_ids<a name='oci_database_db_system_backup_network_nsg_ids'>

A list of the [OCIDs](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the network security groups (NSGs) that the backup network of this DB system belongs to. Setting this to an empty array after the list is created removes the resource from all NSGs. For more information about NSGs, see [Security Rules](https://docs.cloud.oracle.com/Content/Network/Concepts/securityrules.htm). Applicable only to Exadata DB systems.
Rather use the property `backup_network_nsgs` instead of a direct OCID reference.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_database_db_system](#attributes)

### backup_network_nsgs<a name='oci_database_db_system_backup_network_nsgs'>

The Puppet name of the resource identified by `backup_network_nsg_ids`.

See the documentation of backup_network_nsg_ids for all details.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_database_db_system](#attributes)

### backup_subnet<a name='oci_database_db_system_backup_subnet'>

The Puppet name of the resource identified by `backup_subnet_id`.

See the documentation of backup_subnet_id for all details.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_database_db_system](#attributes)

### backup_subnet_id<a name='oci_database_db_system_backup_subnet_id'>

  The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the backup network subnet the DB system is associated with. Applicable only to Exadata DB systems.

**Subnet Restriction:** See the subnet restrictions information for **subnetId**.
  Rather use the property `backup_subnet` instead of a direct OCID reference.

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_database_db_system](#attributes)

### cluster_name<a name='oci_database_db_system_cluster_name'>

The cluster name for Exadata and 2-node RAC virtual machine DB systems. The cluster name must begin with an an alphabetic character, and may contain hyphens (-). Underscores (_) are not permitted. The cluster name can be no longer than 11 characters and is not case sensitive.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_database_db_system](#attributes)

### compartment<a name='oci_database_db_system_compartment'>

The Puppet name of the resource identified by `compartment_id`.

See the documentation of compartment_id for all details.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_database_db_system](#attributes)

### compartment_id<a name='oci_database_db_system_compartment_id'>

The OCID of the compartment that contains the object.

Rather use the property `compartment` instead of a direct OCID reference.

This documentation is generated from the Ruby OCI SDK.



[Back to overview of oci_database_db_system](#attributes)

### cpu_core_count<a name='oci_database_db_system_cpu_core_count'>

The number of CPU cores enabled on the DB system.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_database_db_system](#attributes)

### data_storage_percentage<a name='oci_database_db_system_data_storage_percentage'>

  The percentage assigned to DATA storage (user data and database files).
The remaining percentage is assigned to RECO storage (database redo logs, archive logs, and recovery manager backups). Accepted values are 40 and 80. The default is 80 percent assigned to DATA storage. Not applicable for virtual machine DB systems.

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_database_db_system](#attributes)

### data_storage_size_in_gbs<a name='oci_database_db_system_data_storage_size_in_gbs'>

The data storage size, in gigabytes, that is currently available to the DB system. Applies only for virtual machine DB systems.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_database_db_system](#attributes)

### database_edition<a name='oci_database_db_system_database_edition'>

  The Oracle Database Edition that applies to all the databases on the DB system.
Exadata DB systems and 2-node RAC DB systems require ENTERPRISE_EDITION_EXTREME_PERFORMANCE.

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_database_db_system](#attributes)

### db_home<a name='oci_database_db_system_db_home'>

This attribute is required.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_database_db_system](#attributes)

### db_system_name<a name='oci_database_db_system_db_system_name'>

The name of the db_system.



[Back to overview of oci_database_db_system](#attributes)

### db_system_options<a name='oci_database_db_system_db_system_options'>





[Back to overview of oci_database_db_system](#attributes)

### defined_tags<a name='oci_database_db_system_defined_tags'>

  Defined tags for this resource. Each key is predefined and scoped to a namespace.
For more information, see [Resource Tags](https://docs.cloud.oracle.com/Content/General/Concepts/resourcetags.htm).

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_database_db_system](#attributes)

### disable_corrective_change<a name='oci_database_db_system_disable_corrective_change'>

Disable the modification of a resource when Puppet decides it is a corrective change.

(requires easy_type V2.11.0 or higher)

When using a Puppet Server, Puppet knows about adaptive and corrective changes. A corrective change
is when Puppet notices that the resource has changed, but the catalog has not changed. This can occur
for example, when a user, by accident or willingly, changed something on the system that Puppet is
managing. The normal Puppet process then repairs this and puts the resource back in the state as defined
in the catalog. This process is precisely what you want most of the time, but not always. This can
sometimes also occur when a hardware or network error occurs. Then Puppet cannot correctly determine
the current state of the system and thinks the resource is changed, while in fact, it is not. Letting
Puppet recreate remove or change the resource in these cases, is NOT wat you want.

Using the `disable_corrective_change` parameter, you can disable corrective changes on the current resource.

Here is an example of this:

    crucial_resource {'be_carefull':
      ...
      disable_corrective_change => true,
      ...
    }

When a corrective ensure does happen on the resource Puppet will not modify the resource
and signal an error:

        Error: Corrective change present requested by catalog, but disabled by parameter disable_corrective_change
        Error: /Stage[main]/Main/Crucial_resource[be_carefull]/parameter: change from '10' to '20' failed: Corrective change present requested by catalog, but disabled by parameter disable_corrective_change. (corrective)



[Back to overview of oci_database_db_system](#attributes)

### disable_corrective_ensure<a name='oci_database_db_system_disable_corrective_ensure'>

Disable the creation or removal of a resource when Puppet decides is a corrective change.

(requires easy_type V2.11.0 or higher)

When using a Puppet Server, Puppet knows about adaptive and corrective changes. A corrective change
is when Puppet notices that the resource has changed, but the catalog has not changed. This can occur
for example, when a user, by accident or willingly, changed something on the system that Puppet is
managing. The normal Puppet process then repairs this and puts the resource back in the state as defined
in the catalog. This process is precisely what you want most of the time, but not always. This can
sometimes also occur when a hardware or network error occurs. Then Puppet cannot correctly determine
the current state of the system and thinks the resource is changed, while in fact, it is not. Letting
Puppet recreate remove or change the resource in these cases, is NOT wat you want.

Using the `disable_corrective_ensure` parameter, you can disable corrective ensure present or ensure absent actions on the current resource.

Here is an example of this:

    crucial_resource {'be_carefull':
      ensure                    => 'present',
      ...
      disable_corrective_ensure => true,
      ...
    }

When a corrective ensure does happen on the resource Puppet will not create or remove the resource
and signal an error:

        Error: Corrective ensure present requested by catalog, but disabled by parameter disable_corrective_ensure.
        Error: /Stage[main]/Main/Crucial_resource[be_carefull]/ensure: change from 'absent' to 'present' failed: Corrective ensure present requested by catalog, but disabled by parameter disable_corrective_ensure. (corrective)



[Back to overview of oci_database_db_system](#attributes)

### disk_redundancy<a name='oci_database_db_system_disk_redundancy'>

  The type of redundancy configured for the DB system.
Normal is 2-way redundancy, recommended for test and development systems.
High is 3-way redundancy, recommended for production systems.

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_database_db_system](#attributes)

### domain<a name='oci_database_db_system_domain'>

The domain name for the DB system.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_database_db_system](#attributes)

### ensure<a name='oci_database_db_system_ensure'>

The basic property that the resource should be in.

Valid values are `present`, `absent`. 

[Back to overview of oci_database_db_system](#attributes)

### fault_domains<a name='oci_database_db_system_fault_domains'>

List of the Fault Domains in which this DB system is provisioned.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_database_db_system](#attributes)

### freeform_tags<a name='oci_database_db_system_freeform_tags'>

  Free-form tags for this resource. Each tag is a simple key-value pair with no predefined name, type, or namespace.
For more information, see [Resource Tags](https://docs.cloud.oracle.com/Content/General/Concepts/resourcetags.htm).

Example: `{"Department": "Finance"}`

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_database_db_system](#attributes)

### hostname<a name='oci_database_db_system_hostname'>

The hostname for the DB system.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_database_db_system](#attributes)

### id<a name='oci_database_db_system_id'>

The OCID of the resource. This is a read-only property.

This documentation is generated from the Ruby OCI SDK.



[Back to overview of oci_database_db_system](#attributes)

### initial_data_storage_size_in_gb<a name='oci_database_db_system_initial_data_storage_size_in_gb'>





[Back to overview of oci_database_db_system](#attributes)

### iorm_config_cache<a name='oci_database_db_system_iorm_config_cache'>





[Back to overview of oci_database_db_system](#attributes)

### last_patch_history_entry<a name='oci_database_db_system_last_patch_history_entry'>

The Puppet name of the resource identified by `last_patch_history_entry_id`.

See the documentation of last_patch_history_entry_id for all details.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_database_db_system](#attributes)

### last_patch_history_entry_id<a name='oci_database_db_system_last_patch_history_entry_id'>

The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the last patch history. This value is updated as soon as a patch operation starts.
Rather use the property `last_patch_history_entry` instead of a direct OCID reference.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_database_db_system](#attributes)

### license_model<a name='oci_database_db_system_license_model'>

The Oracle license model that applies to all the databases on the DB system. The default is LICENSE_INCLUDED.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_database_db_system](#attributes)

### lifecycle_state<a name='oci_database_db_system_lifecycle_state'>

The current state of the DB system.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_database_db_system](#attributes)

### listener_port<a name='oci_database_db_system_listener_port'>

The port number configured for the listener on the DB system.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_database_db_system](#attributes)

### name<a name='oci_database_db_system_name'>

The full name of the object.



[Back to overview of oci_database_db_system](#attributes)

### node_count<a name='oci_database_db_system_node_count'>

The number of nodes in the DB system. For RAC DB systems, the value is greater than 1.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_database_db_system](#attributes)

### nsg_ids<a name='oci_database_db_system_nsg_ids'>

  A list of the [OCIDs](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the network security groups (NSGs) that this resource belongs to. Setting this to an empty array after the list is created removes the resource from all NSGs. For more information about NSGs, see [Security Rules](https://docs.cloud.oracle.com/Content/Network/Concepts/securityrules.htm).
**NsgIds restrictions:**
- Autonomous Databases with private access require at least 1 Network Security Group (NSG). The nsgIds array cannot be empty.
  Rather use the property `nsgs` instead of a direct OCID reference.

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_database_db_system](#attributes)

### nsgs<a name='oci_database_db_system_nsgs'>

The Puppet name of the resource identified by `nsg_ids`.

See the documentation of nsg_ids for all details.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_database_db_system](#attributes)

### oci_timeout<a name='oci_database_db_system_oci_timeout'>

The maximum time to wait for the OCI resource to be in the ready state.



[Back to overview of oci_database_db_system](#attributes)

### oci_wait_interval<a name='oci_database_db_system_oci_wait_interval'>

The interval beween calls to OCI to check if a resource is in the ready state.



[Back to overview of oci_database_db_system](#attributes)

### present_states<a name='oci_database_db_system_present_states'>

The OCI states, puppet will detect as the resource being present.



[Back to overview of oci_database_db_system](#attributes)

### provider<a name='oci_database_db_system_provider'>

The specific backend to use for this `oci_database_db_system`
resource. You will seldom need to specify this --- Puppet will usually
discover the appropriate provider for your platform.Available providers are:

sdk
: This provider uses the [Oracle Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk) to do its work.



[Back to overview of oci_database_db_system](#attributes)

### reco_storage_size_in_gb<a name='oci_database_db_system_reco_storage_size_in_gb'>

The RECO/REDO storage size, in gigabytes, that is currently allocated to the DB system. Applies only for virtual machine DB systems.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_database_db_system](#attributes)

### scan_dns_record<a name='oci_database_db_system_scan_dns_record'>

The Puppet name of the resource identified by `scan_dns_record_id`.

See the documentation of scan_dns_record_id for all details.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_database_db_system](#attributes)

### scan_dns_record_id<a name='oci_database_db_system_scan_dns_record_id'>

The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the DNS record for the SCAN IP addresses that are associated with the DB system.
Rather use the property `scan_dns_record` instead of a direct OCID reference.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_database_db_system](#attributes)

### scan_ip_ids<a name='oci_database_db_system_scan_ip_ids'>

  The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the Single Client Access Name (SCAN) IP addresses associated with the DB system.
SCAN IP addresses are typically used for load balancing and are not assigned to any interface.
Oracle Clusterware directs the requests to the appropriate nodes in the cluster.

**Note:** For a single-node DB system, this list is empty.
  Rather use the property `scan_ips` instead of a direct OCID reference.

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_database_db_system](#attributes)

### scan_ips<a name='oci_database_db_system_scan_ips'>

The Puppet name of the resource identified by `scan_ip_ids`.

See the documentation of scan_ip_ids for all details.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_database_db_system](#attributes)

### shape<a name='oci_database_db_system_shape'>

  The shape of the DB system. The shape determines resources to allocate to the DB system.
- For virtual machine shapes, the number of CPU cores and memory
- For bare metal and Exadata shapes, the number of CPU cores, storage, and memory

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_database_db_system](#attributes)

### source<a name='oci_database_db_system_source'>





[Back to overview of oci_database_db_system](#attributes)

### sparse_diskgroup<a name='oci_database_db_system_sparse_diskgroup'>

True, if Sparse Diskgroup is configured for Exadata dbsystem, False, if Sparse diskgroup was not configured.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_database_db_system](#attributes)

### ssh_public_keys<a name='oci_database_db_system_ssh_public_keys'>

The public key portion of one or more key pairs used for SSH access to the DB system.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_database_db_system](#attributes)

### subnet<a name='oci_database_db_system_subnet'>

The Puppet name of the resource identified by `subnet_id`.

See the documentation of subnet_id for all details.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_database_db_system](#attributes)

### subnet_id<a name='oci_database_db_system_subnet_id'>

  The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the subnet the DB system is associated with.

**Subnet Restrictions:**
- For bare metal DB systems and for single node virtual machine DB systems, do not use a subnet that overlaps with 192.168.16.16/28.
- For Exadata and virtual machine 2-node RAC DB systems, do not use a subnet that overlaps with 192.168.128.0/20.

These subnets are used by the Oracle Clusterware private interconnect on the database instance.
Specifying an overlapping subnet will cause the private interconnect to malfunction.
This restriction applies to both the client subnet and backup subnet.
  Rather use the property `subnet` instead of a direct OCID reference.

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_database_db_system](#attributes)

### synchronized<a name='oci_database_db_system_synchronized'>

Specifies if Puppet waits for OCI actions to be ready before moving on to an other resource.



[Back to overview of oci_database_db_system](#attributes)

### tenant<a name='oci_database_db_system_tenant'>

The tenant for this resource.



[Back to overview of oci_database_db_system](#attributes)

### time_created<a name='oci_database_db_system_time_created'>

The date and time the DB system was created.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_database_db_system](#attributes)

### time_zone<a name='oci_database_db_system_time_zone'>

The time zone of the DB system. For details, see [DB System Time Zones](https://docs.cloud.oracle.com/Content/Database/References/timezones.htm).

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_database_db_system](#attributes)

### version<a name='oci_database_db_system_version'>

The Oracle Database version of the DB system.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_database_db_system](#attributes)

### vip_ids<a name='oci_database_db_system_vip_ids'>

  The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the virtual IP (VIP) addresses associated with the DB system.
The Cluster Ready Services (CRS) creates and maintains one VIP address for each node in the DB system to
enable failover. If one node fails, the VIP is reassigned to another active node in the cluster.

**Note:** For a single-node DB system, this list is empty.
  Rather use the property `vips` instead of a direct OCID reference.

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_database_db_system](#attributes)

### vips<a name='oci_database_db_system_vips'>

The Puppet name of the resource identified by `vip_ids`.

See the documentation of vip_ids for all details.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_database_db_system](#attributes)
