---
title: oci core volume
keywords: documentation
layout: documentation
sidebar: oci_config_sidebar
toc: false
---
## Overview

  A detachable block volume device that allows you to dynamically expand
the storage capacity of an instance. For more information, see
[Overview of Cloud Volume Storage](https://docs.cloud.oracle.com/Content/Block/Concepts/overview.htm).

To use any of the API operations, you must be authorized in an IAM policy. If you're not authorized,
talk to an administrator. If you're an administrator who needs to write policies to give users access, see
[Getting Started with Policies](https://docs.cloud.oracle.com/Content/Identity/Concepts/policygetstarted.htm).

**Warning:** Oracle recommends that you avoid using any confidential information when you
supply string values using the API.

  Here is an example on how to use this:

    oci_core_volume { 'tenant (root)/my_volume':
        ensure              => 'present',
        availability_domain => 'arMl:EU-FRANKFURT-1-AD-1',
        size_in_gbs         => 50,
      }

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).

## Attributes



Attribute Name                                                          | Short Description                                                                                 |
----------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------- |
[absent_states](#oci_core_volume_absent_states)                         | The OCI states, puppet will detect as the resource being absent.                                  |
[availability_domain](#oci_core_volume_availability_domain)             |   The availability domain of the volume.                                                          |
[backup_policy](#oci_core_volume_backup_policy)                         | The Puppet name of the resource identified by `backup_policy_id`.                                 |
[backup_policy_id](#oci_core_volume_backup_policy_id)                   | created volume.                                                                                   |
[compartment](#oci_core_volume_compartment)                             | The Puppet name of the resource identified by `compartment_id`.                                   |
[compartment_id](#oci_core_volume_compartment_id)                       | The OCID of the compartment that contains the object.                                             |
[defined_tags](#oci_core_volume_defined_tags)                           |   Defined tags for this resource.                                                                 |
[disable_corrective_change](#oci_core_volume_disable_corrective_change) | Disable the modification of a resource when Puppet decides it is a corrective change.             |
[disable_corrective_ensure](#oci_core_volume_disable_corrective_ensure) | Disable the creation or removal of a resource when Puppet decides is a corrective change.         |
[ensure](#oci_core_volume_ensure)                                       | The basic property that the resource should be in.                                                |
[freeform_tags](#oci_core_volume_freeform_tags)                         |   Free-form tags for this resource.                                                               |
[id](#oci_core_volume_id)                                               | The OCID of the resource.                                                                         |
[is_hydrated](#oci_core_volume_is_hydrated)                             | Specifies whether the cloned volume's data has finished copying from the source volume or backup. |
[kms_key](#oci_core_volume_kms_key)                                     | The Puppet name of the resource identified by `kms_key_id`.                                       |
[kms_key_id](#oci_core_volume_kms_key_id)                               | for the volume.                                                                                   |
[lifecycle_state](#oci_core_volume_lifecycle_state)                     | The current state of a volume.                                                                    |
[name](#oci_core_volume_name)                                           | The full name of the object.                                                                      |
[oci_timeout](#oci_core_volume_oci_timeout)                             | The maximum time to wait for the OCI resource to be in the ready state.                           |
[oci_wait_interval](#oci_core_volume_oci_wait_interval)                 | The interval beween calls to OCI to check if a resource is in the ready state.                    |
[present_states](#oci_core_volume_present_states)                       | The OCI states, puppet will detect as the resource being present.                                 |
[provider](#oci_core_volume_provider)                                   | resource.                                                                                         |
[size_in_gbs](#oci_core_volume_size_in_gbs)                             | The size of the volume in GBs.                                                                    |
[size_in_mbs](#oci_core_volume_size_in_mbs)                             |   The size of the volume in MBs.                                                                  |
[source_details](#oci_core_volume_source_details)                       |   Specifies the volume source details for a new Block volume.                                     |
[synchronized](#oci_core_volume_synchronized)                           | Specifies if Puppet waits for OCI actions to be ready before moving on to an other resource.      |
[system_tags](#oci_core_volume_system_tags)                             |   System tags for this resource.                                                                  |
[tenant](#oci_core_volume_tenant)                                       | The tenant for this resource.                                                                     |
[time_created](#oci_core_volume_time_created)                           | The date and time the volume was created.                                                         |
[volume_group](#oci_core_volume_volume_group)                           | The Puppet name of the resource identified by `volume_group_id`.                                  |
[volume_group_id](#oci_core_volume_volume_group_id)                     | The OCID of the source volume group.                                                              |
[volume_name](#oci_core_volume_volume_name)                             | The name of the volume.                                                                           |
[vpus_per_gb](#oci_core_volume_vpus_per_gb)                             | representing the Block Volume service's elastic performance options.                              |




### absent_states<a name='oci_core_volume_absent_states'>

The OCI states, puppet will detect as the resource being absent.



[Back to overview of oci_core_volume](#attributes)

### availability_domain<a name='oci_core_volume_availability_domain'>

  The availability domain of the volume.

Example: `Uocm:PHX-AD-1`

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_volume](#attributes)

### backup_policy<a name='oci_core_volume_backup_policy'>

The Puppet name of the resource identified by `backup_policy_id`.

See the documentation of backup_policy_id for all details.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_volume](#attributes)

### backup_policy_id<a name='oci_core_volume_backup_policy_id'>

  If provided, specifies the ID of the volume backup policy to assign to the newly
created volume. If omitted, no policy will be assigned.
  Rather use the property `backup_policy` instead of a direct OCID reference.

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_volume](#attributes)

### compartment<a name='oci_core_volume_compartment'>

The Puppet name of the resource identified by `compartment_id`.

See the documentation of compartment_id for all details.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_volume](#attributes)

### compartment_id<a name='oci_core_volume_compartment_id'>

The OCID of the compartment that contains the object.

Rather use the property `compartment` instead of a direct OCID reference.

This documentation is generated from the Ruby OCI SDK.



[Back to overview of oci_core_volume](#attributes)

### defined_tags<a name='oci_core_volume_defined_tags'>

  Defined tags for this resource. Each key is predefined and scoped to a
namespace. For more information, see [Resource Tags](https://docs.cloud.oracle.com/Content/General/Concepts/resourcetags.htm).

Example: `{"Operations": {"CostCenter": "42"}}`

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_volume](#attributes)

### disable_corrective_change<a name='oci_core_volume_disable_corrective_change'>

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



[Back to overview of oci_core_volume](#attributes)

### disable_corrective_ensure<a name='oci_core_volume_disable_corrective_ensure'>

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



[Back to overview of oci_core_volume](#attributes)

### ensure<a name='oci_core_volume_ensure'>

The basic property that the resource should be in.

Valid values are `present`, `absent`. 

[Back to overview of oci_core_volume](#attributes)

### freeform_tags<a name='oci_core_volume_freeform_tags'>

  Free-form tags for this resource. Each tag is a simple key-value pair with no
predefined name, type, or namespace. For more information, see [Resource Tags](https://docs.cloud.oracle.com/Content/General/Concepts/resourcetags.htm).

Example: `{"Department": "Finance"}`

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_volume](#attributes)

### id<a name='oci_core_volume_id'>

The OCID of the resource. This is a read-only property.

This documentation is generated from the Ruby OCI SDK.



[Back to overview of oci_core_volume](#attributes)

### is_hydrated<a name='oci_core_volume_is_hydrated'>

Specifies whether the cloned volume's data has finished copying from the source volume or backup.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_volume](#attributes)

### kms_key<a name='oci_core_volume_kms_key'>

The Puppet name of the resource identified by `kms_key_id`.

See the documentation of kms_key_id for all details.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_volume](#attributes)

### kms_key_id<a name='oci_core_volume_kms_key_id'>

  The OCID of the Key Management key to assign as the master encryption key
for the volume.
  Rather use the property `kms_key` instead of a direct OCID reference.

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_volume](#attributes)

### lifecycle_state<a name='oci_core_volume_lifecycle_state'>

The current state of a volume.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_volume](#attributes)

### name<a name='oci_core_volume_name'>

The full name of the object.



[Back to overview of oci_core_volume](#attributes)

### oci_timeout<a name='oci_core_volume_oci_timeout'>

The maximum time to wait for the OCI resource to be in the ready state.



[Back to overview of oci_core_volume](#attributes)

### oci_wait_interval<a name='oci_core_volume_oci_wait_interval'>

The interval beween calls to OCI to check if a resource is in the ready state.



[Back to overview of oci_core_volume](#attributes)

### present_states<a name='oci_core_volume_present_states'>

The OCI states, puppet will detect as the resource being present.



[Back to overview of oci_core_volume](#attributes)

### provider<a name='oci_core_volume_provider'>

The specific backend to use for this `oci_core_volume`
resource. You will seldom need to specify this --- Puppet will usually
discover the appropriate provider for your platform.Available providers are:

sdk
: This provider uses the [Oracle Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk) to do its work.



[Back to overview of oci_core_volume](#attributes)

### size_in_gbs<a name='oci_core_volume_size_in_gbs'>

The size of the volume in GBs.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_volume](#attributes)

### size_in_mbs<a name='oci_core_volume_size_in_mbs'>

  The size of the volume in MBs. The value must be a multiple of 1024.
This field is deprecated. Use sizeInGBs instead.

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_volume](#attributes)

### source_details<a name='oci_core_volume_source_details'>

  Specifies the volume source details for a new Block volume. The volume source is either another Block volume in the same availability domain or a Block volume backup.
This is an optional field. If not specified or set to null, the new Block volume will be empty.
When specified, the new Block volume will contain data from the source volume or backup.

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_volume](#attributes)

### synchronized<a name='oci_core_volume_synchronized'>

Specifies if Puppet waits for OCI actions to be ready before moving on to an other resource.



[Back to overview of oci_core_volume](#attributes)

### system_tags<a name='oci_core_volume_system_tags'>

  System tags for this resource. Each key is predefined and scoped to a namespace.
Example: `{"foo-namespace": {"bar-key": "value"}}`

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_volume](#attributes)

### tenant<a name='oci_core_volume_tenant'>

The tenant for this resource.



[Back to overview of oci_core_volume](#attributes)

### time_created<a name='oci_core_volume_time_created'>

The date and time the volume was created. Format defined by RFC3339.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_volume](#attributes)

### volume_group<a name='oci_core_volume_volume_group'>

The Puppet name of the resource identified by `volume_group_id`.

See the documentation of volume_group_id for all details.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_volume](#attributes)

### volume_group_id<a name='oci_core_volume_volume_group_id'>

The OCID of the source volume group.
Rather use the property `volume_group` instead of a direct OCID reference.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_volume](#attributes)

### volume_name<a name='oci_core_volume_volume_name'>

The name of the volume.



[Back to overview of oci_core_volume](#attributes)

### vpus_per_gb<a name='oci_core_volume_vpus_per_gb'>

  The number of volume performance units (VPUs) that will be applied to this volume per GB,
representing the Block Volume service's elastic performance options.
See [Block Volume Elastic Performance](https://docs.cloud.oracle.com/Content/Block/Concepts/blockvolumeelasticperformance.htm) for more information.

Allowed values:

  * `0`: Represents Lower Cost option.

  * `10`: Represents Balanced option.

  * `20`: Represents Higher Performance option.

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_volume](#attributes)
