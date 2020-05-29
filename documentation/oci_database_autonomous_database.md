---
title: oci database autonomous database
keywords: documentation
layout: documentation
sidebar: oci_config_sidebar
toc: false
---
## Overview

An Oracle Autonomous Database.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).

## Attributes



Attribute Name                                                                                                                     | Short Description                                                                                                                                                    |
---------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
[absent_states](#oci_database_autonomous_database_absent_states)                                                                   | The OCI states, puppet will detect as the resource being absent.                                                                                                     |
[admin_password](#oci_database_autonomous_database_admin_password)                                                                 | 
                                                                                                                                                                    |
[autonomous_container_database](#oci_database_autonomous_database_autonomous_container_database)                                   | The Puppet name of the resource identified by `autonomous_container_database_id`.                                                                                    |
[autonomous_container_database_id](#oci_database_autonomous_database_autonomous_container_database_id)                             | The Autonomous Container Database [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).                                                    |
[autonomous_database_name](#oci_database_autonomous_database_autonomous_database_name)                                             | The name of the autonomous_database.                                                                                                                                 |
[compartment](#oci_database_autonomous_database_compartment)                                                                       | The Puppet name of the resource identified by `compartment_id`.                                                                                                      |
[compartment_id](#oci_database_autonomous_database_compartment_id)                                                                 | The OCID of the compartment that contains the object.                                                                                                                |
[connection_strings](#oci_database_autonomous_database_connection_strings)                                                         | The connection string used to connect to the Autonomous Database.                                                                                                    |
[connection_urls](#oci_database_autonomous_database_connection_urls)                                                               | 
                                                                                                                                                                    |
[cpu_core_count](#oci_database_autonomous_database_cpu_core_count)                                                                 | The number of CPU cores to be made available to the database.                                                                                                        |
[data_safe_status](#oci_database_autonomous_database_data_safe_status)                                                             | Status of the Data Safe registration for this Autonomous Database.                                                                                                   |
[data_storage_size_in_tbs](#oci_database_autonomous_database_data_storage_size_in_tbs)                                             | The quantity of data in the database, in terabytes.                                                                                                                  |
[db_name](#oci_database_autonomous_database_db_name)                                                                               | The database name.                                                                                                                                                   |
[db_version](#oci_database_autonomous_database_db_version)                                                                         | A valid Oracle Database version for Autonomous Database.                                                                                                             |
[db_workload](#oci_database_autonomous_database_db_workload)                                                                       | The Autonomous Database workload type.                                                                                                                               |
[defined_tags](#oci_database_autonomous_database_defined_tags)                                                                     |   Defined tags for this resource.                                                                                                                                    |
[disable_corrective_change](#oci_database_autonomous_database_disable_corrective_change)                                           | Disable the modification of a resource when Puppet decides it is a corrective change.                                                                                |
[disable_corrective_ensure](#oci_database_autonomous_database_disable_corrective_ensure)                                           | Disable the creation or removal of a resource when Puppet decides is a corrective change.                                                                            |
[ensure](#oci_database_autonomous_database_ensure)                                                                                 | The basic property that the resource should be in.                                                                                                                   |
[freeform_tags](#oci_database_autonomous_database_freeform_tags)                                                                   |   Free-form tags for this resource.                                                                                                                                  |
[id](#oci_database_autonomous_database_id)                                                                                         | The OCID of the resource.                                                                                                                                            |
[is_auto_scaling_enabled](#oci_database_autonomous_database_is_auto_scaling_enabled)                                               | Indicates if auto scaling is enabled for the Autonomous Database CPU core count.                                                                                     |
[is_dedicated](#oci_database_autonomous_database_is_dedicated)                                                                     | True if the database uses the [dedicated deployment](https://docs.cloud.oracle.com/Content/Database/Concepts/adbddoverview.htm) option.                              |
[is_free_tier](#oci_database_autonomous_database_is_free_tier)                                                                     | Indicates if this is an Always Free resource.                                                                                                                        |
[is_preview](#oci_database_autonomous_database_is_preview)                                                                         | Indicates if the Autonomous Database version is a preview version.                                                                                                   |
[is_preview_version_with_service_terms_accepted](#oci_database_autonomous_database_is_preview_version_with_service_terms_accepted) | 
                                                                                                                                                                    |
[license_model](#oci_database_autonomous_database_license_model)                                                                   | The Oracle license model that applies to the Oracle Autonomous Database.                                                                                             |
[lifecycle_details](#oci_database_autonomous_database_lifecycle_details)                                                           | Information about the current lifecycle state.                                                                                                                       |
[lifecycle_state](#oci_database_autonomous_database_lifecycle_state)                                                               | The current state of the database.                                                                                                                                   |
[name](#oci_database_autonomous_database_name)                                                                                     | The full name of the object.                                                                                                                                         |
[nsg_ids](#oci_database_autonomous_database_nsg_ids)                                                                               |   A list of the [OCIDs](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the network security groups (NSGs) that this resource belongs to. |
[nsgs](#oci_database_autonomous_database_nsgs)                                                                                     | The Puppet name of the resource identified by `nsg_ids`.                                                                                                             |
[oci_timeout](#oci_database_autonomous_database_oci_timeout)                                                                       | The maximum time to wait for the OCI resource to be in the ready state.                                                                                              |
[oci_wait_interval](#oci_database_autonomous_database_oci_wait_interval)                                                           | The interval beween calls to OCI to check if a resource is in the ready state.                                                                                       |
[present_states](#oci_database_autonomous_database_present_states)                                                                 | The OCI states, puppet will detect as the resource being present.                                                                                                    |
[private_endpoint](#oci_database_autonomous_database_private_endpoint)                                                             | The private endpoint for the resource.                                                                                                                               |
[private_endpoint_label](#oci_database_autonomous_database_private_endpoint_label)                                                 | The private endpoint label for the resource.                                                                                                                         |
[provider](#oci_database_autonomous_database_provider)                                                                             | resource.                                                                                                                                                            |
[service_console_url](#oci_database_autonomous_database_service_console_url)                                                       | The URL of the Service Console for the Autonomous Database.                                                                                                          |
[source](#oci_database_autonomous_database_source)                                                                                 | 
                                                                                                                                                                    |
[subnet](#oci_database_autonomous_database_subnet)                                                                                 | The Puppet name of the resource identified by `subnet_id`.                                                                                                           |
[subnet_id](#oci_database_autonomous_database_subnet_id)                                                                           |   The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the subnet the resource is associated with.                                  |
[synchronized](#oci_database_autonomous_database_synchronized)                                                                     | Specifies if Puppet waits for OCI actions to be ready before moving on to an other resource.                                                                         |
[system_tags](#oci_database_autonomous_database_system_tags)                                                                       |   System tags for this resource.                                                                                                                                     |
[tenant](#oci_database_autonomous_database_tenant)                                                                                 | The tenant for this resource.                                                                                                                                        |
[time_created](#oci_database_autonomous_database_time_created)                                                                     | The date and time the database was created.                                                                                                                          |
[time_deletion_of_free_autonomous_database](#oci_database_autonomous_database_time_deletion_of_free_autonomous_database)           | The date and time the Always Free database will be automatically deleted because of inactivity.                                                                      |
[time_maintenance_begin](#oci_database_autonomous_database_time_maintenance_begin)                                                 | The date and time when maintenance will begin.                                                                                                                       |
[time_maintenance_end](#oci_database_autonomous_database_time_maintenance_end)                                                     | The date and time when maintenance will end.                                                                                                                         |
[time_reclamation_of_free_autonomous_database](#oci_database_autonomous_database_time_reclamation_of_free_autonomous_database)     | The date and time the Always Free database will be stopped because of inactivity.                                                                                    |
[used_data_storage_size_in_tbs](#oci_database_autonomous_database_used_data_storage_size_in_tbs)                                   | The amount of storage that has been used, in terabytes.                                                                                                              |
[whitelisted_ips](#oci_database_autonomous_database_whitelisted_ips)                                                               |   The client IP access control list (ACL).                                                                                                                           |




### absent_states<a name='oci_database_autonomous_database_absent_states'>

The OCI states, puppet will detect as the resource being absent.



[Back to overview of oci_database_autonomous_database](#attributes)

### admin_password<a name='oci_database_autonomous_database_admin_password'>





[Back to overview of oci_database_autonomous_database](#attributes)

### autonomous_container_database<a name='oci_database_autonomous_database_autonomous_container_database'>

The Puppet name of the resource identified by `autonomous_container_database_id`.

See the documentation of autonomous_container_database_id for all details.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_database_autonomous_database](#attributes)

### autonomous_container_database_id<a name='oci_database_autonomous_database_autonomous_container_database_id'>

The Autonomous Container Database [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm).
Rather use the property `autonomous_container_database` instead of a direct OCID reference.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_database_autonomous_database](#attributes)

### autonomous_database_name<a name='oci_database_autonomous_database_autonomous_database_name'>

The name of the autonomous_database.



[Back to overview of oci_database_autonomous_database](#attributes)

### compartment<a name='oci_database_autonomous_database_compartment'>

The Puppet name of the resource identified by `compartment_id`.

See the documentation of compartment_id for all details.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_database_autonomous_database](#attributes)

### compartment_id<a name='oci_database_autonomous_database_compartment_id'>

The OCID of the compartment that contains the object.

Rather use the property `compartment` instead of a direct OCID reference.

This documentation is generated from the Ruby OCI SDK.



[Back to overview of oci_database_autonomous_database](#attributes)

### connection_strings<a name='oci_database_autonomous_database_connection_strings'>

The connection string used to connect to the Autonomous Database. The username for the Service Console is ADMIN. Use the password you entered when creating the Autonomous Database for the password value.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_database_autonomous_database](#attributes)

### connection_urls<a name='oci_database_autonomous_database_connection_urls'>





[Back to overview of oci_database_autonomous_database](#attributes)

### cpu_core_count<a name='oci_database_autonomous_database_cpu_core_count'>

The number of CPU cores to be made available to the database.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_database_autonomous_database](#attributes)

### data_safe_status<a name='oci_database_autonomous_database_data_safe_status'>

Status of the Data Safe registration for this Autonomous Database.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_database_autonomous_database](#attributes)

### data_storage_size_in_tbs<a name='oci_database_autonomous_database_data_storage_size_in_tbs'>

The quantity of data in the database, in terabytes.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_database_autonomous_database](#attributes)

### db_name<a name='oci_database_autonomous_database_db_name'>

The database name.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_database_autonomous_database](#attributes)

### db_version<a name='oci_database_autonomous_database_db_version'>

A valid Oracle Database version for Autonomous Database.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_database_autonomous_database](#attributes)

### db_workload<a name='oci_database_autonomous_database_db_workload'>

The Autonomous Database workload type. OLTP indicates an Autonomous Transaction Processing database and DW indicates an Autonomous Data Warehouse database.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_database_autonomous_database](#attributes)

### defined_tags<a name='oci_database_autonomous_database_defined_tags'>

  Defined tags for this resource. Each key is predefined and scoped to a namespace.
For more information, see [Resource Tags](https://docs.cloud.oracle.com/Content/General/Concepts/resourcetags.htm).

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_database_autonomous_database](#attributes)

### disable_corrective_change<a name='oci_database_autonomous_database_disable_corrective_change'>

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



[Back to overview of oci_database_autonomous_database](#attributes)

### disable_corrective_ensure<a name='oci_database_autonomous_database_disable_corrective_ensure'>

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



[Back to overview of oci_database_autonomous_database](#attributes)

### ensure<a name='oci_database_autonomous_database_ensure'>

The basic property that the resource should be in.

Valid values are `present`, `absent`. 

[Back to overview of oci_database_autonomous_database](#attributes)

### freeform_tags<a name='oci_database_autonomous_database_freeform_tags'>

  Free-form tags for this resource. Each tag is a simple key-value pair with no predefined name, type, or namespace.
For more information, see [Resource Tags](https://docs.cloud.oracle.com/Content/General/Concepts/resourcetags.htm).

Example: `{"Department": "Finance"}`

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_database_autonomous_database](#attributes)

### id<a name='oci_database_autonomous_database_id'>

The OCID of the resource. This is a read-only property.

This documentation is generated from the Ruby OCI SDK.



[Back to overview of oci_database_autonomous_database](#attributes)

### is_auto_scaling_enabled<a name='oci_database_autonomous_database_is_auto_scaling_enabled'>

Indicates if auto scaling is enabled for the Autonomous Database CPU core count. Note that auto scaling is available for [serverless deployments](https://docs.cloud.oracle.com/Content/Database/Concepts/adboverview.htm#AEI) only.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_database_autonomous_database](#attributes)

### is_dedicated<a name='oci_database_autonomous_database_is_dedicated'>

True if the database uses the [dedicated deployment](https://docs.cloud.oracle.com/Content/Database/Concepts/adbddoverview.htm) option.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_database_autonomous_database](#attributes)

### is_free_tier<a name='oci_database_autonomous_database_is_free_tier'>

Indicates if this is an Always Free resource. The default value is false. Note that Always Free Autonomous Databases have 1 CPU and 20GB memory. For Always Free databases, memory and CPU cannot be scaled.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_database_autonomous_database](#attributes)

### is_preview<a name='oci_database_autonomous_database_is_preview'>

Indicates if the Autonomous Database version is a preview version.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_database_autonomous_database](#attributes)

### is_preview_version_with_service_terms_accepted<a name='oci_database_autonomous_database_is_preview_version_with_service_terms_accepted'>





[Back to overview of oci_database_autonomous_database](#attributes)

### license_model<a name='oci_database_autonomous_database_license_model'>

The Oracle license model that applies to the Oracle Autonomous Database. The default for Autonomous Database using the [shared deployment] is BRING_YOUR_OWN_LICENSE. Note that when provisioning an Autonomous Database using the [dedicated deployment](https://docs.cloud.oracle.com/Content/Database/Concepts/adbddoverview.htm) option, this attribute must be null because the attribute is already set on Autonomous Exadata Infrastructure level.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_database_autonomous_database](#attributes)

### lifecycle_details<a name='oci_database_autonomous_database_lifecycle_details'>

Information about the current lifecycle state.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_database_autonomous_database](#attributes)

### lifecycle_state<a name='oci_database_autonomous_database_lifecycle_state'>

The current state of the database.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_database_autonomous_database](#attributes)

### name<a name='oci_database_autonomous_database_name'>

The full name of the object.



[Back to overview of oci_database_autonomous_database](#attributes)

### nsg_ids<a name='oci_database_autonomous_database_nsg_ids'>

  A list of the [OCIDs](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the network security groups (NSGs) that this resource belongs to. Setting this to an empty array after the list is created removes the resource from all NSGs. For more information about NSGs, see [Security Rules](https://docs.cloud.oracle.com/Content/Network/Concepts/securityrules.htm).
**NsgIds restrictions:**
- Autonomous Databases with private access require at least 1 Network Security Group (NSG). The nsgIds array cannot be empty.
  Rather use the property `nsgs` instead of a direct OCID reference.

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_database_autonomous_database](#attributes)

### nsgs<a name='oci_database_autonomous_database_nsgs'>

The Puppet name of the resource identified by `nsg_ids`.

See the documentation of nsg_ids for all details.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_database_autonomous_database](#attributes)

### oci_timeout<a name='oci_database_autonomous_database_oci_timeout'>

The maximum time to wait for the OCI resource to be in the ready state.



[Back to overview of oci_database_autonomous_database](#attributes)

### oci_wait_interval<a name='oci_database_autonomous_database_oci_wait_interval'>

The interval beween calls to OCI to check if a resource is in the ready state.



[Back to overview of oci_database_autonomous_database](#attributes)

### present_states<a name='oci_database_autonomous_database_present_states'>

The OCI states, puppet will detect as the resource being present.



[Back to overview of oci_database_autonomous_database](#attributes)

### private_endpoint<a name='oci_database_autonomous_database_private_endpoint'>

The private endpoint for the resource.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_database_autonomous_database](#attributes)

### private_endpoint_label<a name='oci_database_autonomous_database_private_endpoint_label'>

The private endpoint label for the resource.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_database_autonomous_database](#attributes)

### provider<a name='oci_database_autonomous_database_provider'>

The specific backend to use for this `oci_database_autonomous_database`
resource. You will seldom need to specify this --- Puppet will usually
discover the appropriate provider for your platform.Available providers are:

sdk
: This provider uses the [Oracle Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk) to do its work.



[Back to overview of oci_database_autonomous_database](#attributes)

### service_console_url<a name='oci_database_autonomous_database_service_console_url'>

The URL of the Service Console for the Autonomous Database.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_database_autonomous_database](#attributes)

### source<a name='oci_database_autonomous_database_source'>





[Back to overview of oci_database_autonomous_database](#attributes)

### subnet<a name='oci_database_autonomous_database_subnet'>

The Puppet name of the resource identified by `subnet_id`.

See the documentation of subnet_id for all details.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_database_autonomous_database](#attributes)

### subnet_id<a name='oci_database_autonomous_database_subnet_id'>

  The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the subnet the resource is associated with.

**Subnet Restrictions:**
- For bare metal DB systems and for single node virtual machine DB systems, do not use a subnet that overlaps with 192.168.16.16/28.
- For Exadata and virtual machine 2-node RAC DB systems, do not use a subnet that overlaps with 192.168.128.0/20.
- For Autonomous Database, setting this will disable public secure access to the database.

These subnets are used by the Oracle Clusterware private interconnect on the database instance.
Specifying an overlapping subnet will cause the private interconnect to malfunction.
This restriction applies to both the client subnet and the backup subnet.
  Rather use the property `subnet` instead of a direct OCID reference.

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_database_autonomous_database](#attributes)

### synchronized<a name='oci_database_autonomous_database_synchronized'>

Specifies if Puppet waits for OCI actions to be ready before moving on to an other resource.



[Back to overview of oci_database_autonomous_database](#attributes)

### system_tags<a name='oci_database_autonomous_database_system_tags'>

  System tags for this resource. Each key is predefined and scoped to a namespace.
For more information, see [Resource Tags](https://docs.cloud.oracle.com/Content/General/Concepts/resourcetags.htm).

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_database_autonomous_database](#attributes)

### tenant<a name='oci_database_autonomous_database_tenant'>

The tenant for this resource.



[Back to overview of oci_database_autonomous_database](#attributes)

### time_created<a name='oci_database_autonomous_database_time_created'>

The date and time the database was created.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_database_autonomous_database](#attributes)

### time_deletion_of_free_autonomous_database<a name='oci_database_autonomous_database_time_deletion_of_free_autonomous_database'>

The date and time the Always Free database will be automatically deleted because of inactivity. If the database is in the STOPPED state and without activity until this time, it will be deleted.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_database_autonomous_database](#attributes)

### time_maintenance_begin<a name='oci_database_autonomous_database_time_maintenance_begin'>

The date and time when maintenance will begin.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_database_autonomous_database](#attributes)

### time_maintenance_end<a name='oci_database_autonomous_database_time_maintenance_end'>

The date and time when maintenance will end.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_database_autonomous_database](#attributes)

### time_reclamation_of_free_autonomous_database<a name='oci_database_autonomous_database_time_reclamation_of_free_autonomous_database'>

The date and time the Always Free database will be stopped because of inactivity. If this time is reached without any database activity, the database will automatically be put into the STOPPED state.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_database_autonomous_database](#attributes)

### used_data_storage_size_in_tbs<a name='oci_database_autonomous_database_used_data_storage_size_in_tbs'>

The amount of storage that has been used, in terabytes.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_database_autonomous_database](#attributes)

### whitelisted_ips<a name='oci_database_autonomous_database_whitelisted_ips'>

  The client IP access control list (ACL). This feature is available for [serverless deployments](https://docs.cloud.oracle.com/Content/Database/Concepts/adboverview.htm#AEI) only.
Only clients connecting from an IP address included in the ACL may access the Autonomous Database instance. This is an array of CIDR (Classless Inter-Domain Routing) notations for a subnet.

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_database_autonomous_database](#attributes)
