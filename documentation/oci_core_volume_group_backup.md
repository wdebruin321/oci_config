---
title: oci core volume group backup
keywords: documentation
layout: documentation
sidebar: oci_config_sidebar
toc: false
---
## Overview

  A point-in-time copy of a volume group that can then be used to create a new volume group
or restore a volume group. For more information, see [Volume Groups](https://docs.cloud.oracle.com/Content/Block/Concepts/volumegroups.htm).

To use any of the API operations, you must be authorized in an IAM policy. If you're not authorized,
talk to an administrator. If you're an administrator who needs to write policies to give users access, see
[Getting Started with Policies](https://docs.cloud.oracle.com/Content/Identity/Concepts/policygetstarted.htm).

**Warning:** Oracle recommends that you avoid using any confidential information when you
supply string values using the API.

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).

## Attributes



Attribute Name                                                                       | Short Description                                                                            |
------------------------------------------------------------------------------------ | -------------------------------------------------------------------------------------------- |
[absent_states](#oci_core_volume_group_backup_absent_states)                         | The OCI states, puppet will detect as the resource being absent.                             |
[compartment](#oci_core_volume_group_backup_compartment)                             | The Puppet name of the resource identified by `compartment_id`.                              |
[compartment_id](#oci_core_volume_group_backup_compartment_id)                       | The OCID of the compartment that contains the object.                                        |
[defined_tags](#oci_core_volume_group_backup_defined_tags)                           |   Defined tags for this resource.                                                            |
[disable_corrective_change](#oci_core_volume_group_backup_disable_corrective_change) | Disable the modification of a resource when Puppet decides it is a corrective change.        |
[disable_corrective_ensure](#oci_core_volume_group_backup_disable_corrective_ensure) | Disable the creation or removal of a resource when Puppet decides is a corrective change.    |
[ensure](#oci_core_volume_group_backup_ensure)                                       | The basic property that the resource should be in.                                           |
[freeform_tags](#oci_core_volume_group_backup_freeform_tags)                         |   Free-form tags for this resource.                                                          |
[id](#oci_core_volume_group_backup_id)                                               | The OCID of the resource.                                                                    |
[lifecycle_state](#oci_core_volume_group_backup_lifecycle_state)                     | The current state of a volume group backup.                                                  |
[name](#oci_core_volume_group_backup_name)                                           | The full name of the object.                                                                 |
[oci_timeout](#oci_core_volume_group_backup_oci_timeout)                             | The maximum time to wait for the OCI resource to be in the ready state.                      |
[oci_wait_interval](#oci_core_volume_group_backup_oci_wait_interval)                 | The interval beween calls to OCI to check if a resource is in the ready state.               |
[present_states](#oci_core_volume_group_backup_present_states)                       | The OCI states, puppet will detect as the resource being present.                            |
[provider](#oci_core_volume_group_backup_provider)                                   | resource.                                                                                    |
[size_in_gbs](#oci_core_volume_group_backup_size_in_gbs)                             | The aggregate size of the volume group backup, in GBs.                                       |
[size_in_mbs](#oci_core_volume_group_backup_size_in_mbs)                             | The aggregate size of the volume group backup, in MBs.                                       |
[synchronized](#oci_core_volume_group_backup_synchronized)                           | Specifies if Puppet waits for OCI actions to be ready before moving on to an other resource. |
[tenant](#oci_core_volume_group_backup_tenant)                                       | The tenant for this resource.                                                                |
[time_created](#oci_core_volume_group_backup_time_created)                           |   The date and time the volume group backup was created.                                     |
[time_request_received](#oci_core_volume_group_backup_time_request_received)         | The date and time the request to create the volume group backup was received.                |
[type](#oci_core_volume_group_backup_type)                                           | The type of backup to create.                                                                |
[unique_size_in_gbs](#oci_core_volume_group_backup_unique_size_in_gbs)               |   The aggregate size used by the volume group backup, in GBs.                                |
[unique_size_in_mbs](#oci_core_volume_group_backup_unique_size_in_mbs)               |   The aggregate size used by the volume group backup, in MBs.                                |
[volume_backup_ids](#oci_core_volume_group_backup_volume_backup_ids)                 | OCIDs for the volume backups in this volume group backup.                                    |
[volume_backups](#oci_core_volume_group_backup_volume_backups)                       | The Puppet name of the resource identified by `volume_backup_ids`.                           |
[volume_group](#oci_core_volume_group_backup_volume_group)                           | The Puppet name of the resource identified by `volume_group_id`.                             |
[volume_group_backup_name](#oci_core_volume_group_backup_volume_group_backup_name)   | The name of the volume_group_backup.                                                         |
[volume_group_id](#oci_core_volume_group_backup_volume_group_id)                     | The OCID of the volume group that needs to be backed up.                                     |




### absent_states<a name='oci_core_volume_group_backup_absent_states'>

The OCI states, puppet will detect as the resource being absent.



[Back to overview of oci_core_volume_group_backup](#attributes)

### compartment<a name='oci_core_volume_group_backup_compartment'>

The Puppet name of the resource identified by `compartment_id`.

See the documentation of compartment_id for all details.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_volume_group_backup](#attributes)

### compartment_id<a name='oci_core_volume_group_backup_compartment_id'>

The OCID of the compartment that contains the object.

Rather use the property `compartment` instead of a direct OCID reference.

This documentation is generated from the Ruby OCI SDK.



[Back to overview of oci_core_volume_group_backup](#attributes)

### defined_tags<a name='oci_core_volume_group_backup_defined_tags'>

  Defined tags for this resource. Each key is predefined and scoped to a
namespace. For more information, see [Resource Tags](https://docs.cloud.oracle.com/Content/General/Concepts/resourcetags.htm).

Example: `{"Operations": {"CostCenter": "42"}}`

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_volume_group_backup](#attributes)

### disable_corrective_change<a name='oci_core_volume_group_backup_disable_corrective_change'>

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



[Back to overview of oci_core_volume_group_backup](#attributes)

### disable_corrective_ensure<a name='oci_core_volume_group_backup_disable_corrective_ensure'>

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



[Back to overview of oci_core_volume_group_backup](#attributes)

### ensure<a name='oci_core_volume_group_backup_ensure'>

The basic property that the resource should be in.

Valid values are `present`, `absent`. 

[Back to overview of oci_core_volume_group_backup](#attributes)

### freeform_tags<a name='oci_core_volume_group_backup_freeform_tags'>

  Free-form tags for this resource. Each tag is a simple key-value pair with no
predefined name, type, or namespace. For more information, see [Resource Tags](https://docs.cloud.oracle.com/Content/General/Concepts/resourcetags.htm).

Example: `{"Department": "Finance"}`

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_volume_group_backup](#attributes)

### id<a name='oci_core_volume_group_backup_id'>

The OCID of the resource. This is a read-only property.

This documentation is generated from the Ruby OCI SDK.



[Back to overview of oci_core_volume_group_backup](#attributes)

### lifecycle_state<a name='oci_core_volume_group_backup_lifecycle_state'>

The current state of a volume group backup.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_volume_group_backup](#attributes)

### name<a name='oci_core_volume_group_backup_name'>

The full name of the object.



[Back to overview of oci_core_volume_group_backup](#attributes)

### oci_timeout<a name='oci_core_volume_group_backup_oci_timeout'>

The maximum time to wait for the OCI resource to be in the ready state.



[Back to overview of oci_core_volume_group_backup](#attributes)

### oci_wait_interval<a name='oci_core_volume_group_backup_oci_wait_interval'>

The interval beween calls to OCI to check if a resource is in the ready state.



[Back to overview of oci_core_volume_group_backup](#attributes)

### present_states<a name='oci_core_volume_group_backup_present_states'>

The OCI states, puppet will detect as the resource being present.



[Back to overview of oci_core_volume_group_backup](#attributes)

### provider<a name='oci_core_volume_group_backup_provider'>

The specific backend to use for this `oci_core_volume_group_backup`
resource. You will seldom need to specify this --- Puppet will usually
discover the appropriate provider for your platform.Available providers are:

sdk
: This provider uses the [Oracle Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk) to do its work.



[Back to overview of oci_core_volume_group_backup](#attributes)

### size_in_gbs<a name='oci_core_volume_group_backup_size_in_gbs'>

The aggregate size of the volume group backup, in GBs.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_volume_group_backup](#attributes)

### size_in_mbs<a name='oci_core_volume_group_backup_size_in_mbs'>

The aggregate size of the volume group backup, in MBs.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_volume_group_backup](#attributes)

### synchronized<a name='oci_core_volume_group_backup_synchronized'>

Specifies if Puppet waits for OCI actions to be ready before moving on to an other resource.



[Back to overview of oci_core_volume_group_backup](#attributes)

### tenant<a name='oci_core_volume_group_backup_tenant'>

The tenant for this resource.



[Back to overview of oci_core_volume_group_backup](#attributes)

### time_created<a name='oci_core_volume_group_backup_time_created'>

  The date and time the volume group backup was created. This is the time the actual point-in-time image
of the volume group data was taken. Format defined by RFC3339.

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_volume_group_backup](#attributes)

### time_request_received<a name='oci_core_volume_group_backup_time_request_received'>

The date and time the request to create the volume group backup was received. Format defined by RFC3339.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_volume_group_backup](#attributes)

### type<a name='oci_core_volume_group_backup_type'>

The type of backup to create. If omitted, defaults to incremental.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_volume_group_backup](#attributes)

### unique_size_in_gbs<a name='oci_core_volume_group_backup_unique_size_in_gbs'>

  The aggregate size used by the volume group backup, in GBs.
It is typically smaller than sizeInGBs, depending on the space
consumed on the volume group and whether the volume backup is full or incremental.

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_volume_group_backup](#attributes)

### unique_size_in_mbs<a name='oci_core_volume_group_backup_unique_size_in_mbs'>

  The aggregate size used by the volume group backup, in MBs.
It is typically smaller than sizeInMBs, depending on the space
consumed on the volume group and whether the volume backup is full or incremental.

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_volume_group_backup](#attributes)

### volume_backup_ids<a name='oci_core_volume_group_backup_volume_backup_ids'>

OCIDs for the volume backups in this volume group backup.
Rather use the property `volume_backups` instead of a direct OCID reference.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_volume_group_backup](#attributes)

### volume_backups<a name='oci_core_volume_group_backup_volume_backups'>

The Puppet name of the resource identified by `volume_backup_ids`.

See the documentation of volume_backup_ids for all details.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_volume_group_backup](#attributes)

### volume_group<a name='oci_core_volume_group_backup_volume_group'>

The Puppet name of the resource identified by `volume_group_id`.

See the documentation of volume_group_id for all details.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_volume_group_backup](#attributes)

### volume_group_backup_name<a name='oci_core_volume_group_backup_volume_group_backup_name'>

The name of the volume_group_backup.



[Back to overview of oci_core_volume_group_backup](#attributes)

### volume_group_id<a name='oci_core_volume_group_backup_volume_group_id'>

The OCID of the volume group that needs to be backed up.
Rather use the property `volume_group` instead of a direct OCID reference.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_volume_group_backup](#attributes)
