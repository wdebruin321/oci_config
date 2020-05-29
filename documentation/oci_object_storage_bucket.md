---
title: oci object storage bucket
keywords: documentation
layout: documentation
sidebar: oci_config_sidebar
toc: false
---
## Overview


Manage object storage buckets.

Here is an example on how to use this:

    oci_object_storage_bucket { 'tenant (root)/my_bucket':
      ensure        => 'present',
      freeform_tags => {'test' => 'no'},
    }

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).

## Attributes



Attribute Name                                                                          | Short Description                                                                                    |
--------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------- |
[absent_states](#oci_object_storage_bucket_absent_states)                               | The OCI states, puppet will detect as the resource being absent.                                     |
[approximate_count](#oci_object_storage_bucket_approximate_count)                       | 
                                                                                                    |
[approximate_size](#oci_object_storage_bucket_approximate_size)                         | 
                                                                                                    |
[bucket_name](#oci_object_storage_bucket_bucket_name)                                   | The name of the bucket.                                                                              |
[compartment](#oci_object_storage_bucket_compartment)                                   | The Puppet name of the resource identified by `compartment_id`.                                      |
[compartment_id](#oci_object_storage_bucket_compartment_id)                             | The OCID of the compartment that contains the object.                                                |
[created_by](#oci_object_storage_bucket_created_by)                                     | 
                                                                                                    |
[defined_tags](#oci_object_storage_bucket_defined_tags)                                 |   Defined tags for this resource.                                                                    |
[disable_corrective_change](#oci_object_storage_bucket_disable_corrective_change)       | Disable the modification of a resource when Puppet decides it is a corrective change.                |
[disable_corrective_ensure](#oci_object_storage_bucket_disable_corrective_ensure)       | Disable the creation or removal of a resource when Puppet decides is a corrective change.            |
[ensure](#oci_object_storage_bucket_ensure)                                             | The basic property that the resource should be in.                                                   |
[etag](#oci_object_storage_bucket_etag)                                                 | 
                                                                                                    |
[freeform_tags](#oci_object_storage_bucket_freeform_tags)                               |   Free-form tags for this resource.                                                                  |
[id](#oci_object_storage_bucket_id)                                                     | The OCID of the resource.                                                                            |
[is_read_only](#oci_object_storage_bucket_is_read_only)                                 | 
                                                                                                    |
[kms_key](#oci_object_storage_bucket_kms_key)                                           | The Puppet name of the resource identified by `kms_key_id`.                                          |
[kms_key_id](#oci_object_storage_bucket_kms_key_id)                                     | Management service to generate a data encryption key or to encrypt or decrypt a data encryption key. |
[metadata](#oci_object_storage_bucket_metadata)                                         | Arbitrary string, up to 4KB, of keys and values for user-defined metadata.                           |
[name](#oci_object_storage_bucket_name)                                                 | The full name of the object.                                                                         |
[namespace](#oci_object_storage_bucket_namespace)                                       | 
                                                                                                    |
[object_events_enabled](#oci_object_storage_bucket_object_events_enabled)               |   Whether or not events are emitted for object state changes in this bucket.                         |
[object_lifecycle_policy_etag](#oci_object_storage_bucket_object_lifecycle_policy_etag) | 
                                                                                                    |
[oci_timeout](#oci_object_storage_bucket_oci_timeout)                                   | The maximum time to wait for the OCI resource to be in the ready state.                              |
[oci_wait_interval](#oci_object_storage_bucket_oci_wait_interval)                       | The interval beween calls to OCI to check if a resource is in the ready state.                       |
[present_states](#oci_object_storage_bucket_present_states)                             | The OCI states, puppet will detect as the resource being present.                                    |
[provider](#oci_object_storage_bucket_provider)                                         | resource.                                                                                            |
[public_access_type](#oci_object_storage_bucket_public_access_type)                     |   The type of public access enabled on this bucket.                                                  |
[replication_enabled](#oci_object_storage_bucket_replication_enabled)                   | 
                                                                                                    |
[storage_tier](#oci_object_storage_bucket_storage_tier)                                 |   The type of storage tier of this bucket.                                                           |
[synchronized](#oci_object_storage_bucket_synchronized)                                 | Specifies if Puppet waits for OCI actions to be ready before moving on to an other resource.         |
[tenant](#oci_object_storage_bucket_tenant)                                             | The tenant for this resource.                                                                        |
[time_created](#oci_object_storage_bucket_time_created)                                 | 
                                                                                                    |




### absent_states<a name='oci_object_storage_bucket_absent_states'>

The OCI states, puppet will detect as the resource being absent.



[Back to overview of oci_object_storage_bucket](#attributes)

### approximate_count<a name='oci_object_storage_bucket_approximate_count'>





[Back to overview of oci_object_storage_bucket](#attributes)

### approximate_size<a name='oci_object_storage_bucket_approximate_size'>





[Back to overview of oci_object_storage_bucket](#attributes)

### bucket_name<a name='oci_object_storage_bucket_bucket_name'>

The name of the bucket.



[Back to overview of oci_object_storage_bucket](#attributes)

### compartment<a name='oci_object_storage_bucket_compartment'>

The Puppet name of the resource identified by `compartment_id`.

See the documentation of compartment_id for all details.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_object_storage_bucket](#attributes)

### compartment_id<a name='oci_object_storage_bucket_compartment_id'>

The OCID of the compartment that contains the object.

Rather use the property `compartment` instead of a direct OCID reference.

This documentation is generated from the Ruby OCI SDK.



[Back to overview of oci_object_storage_bucket](#attributes)

### created_by<a name='oci_object_storage_bucket_created_by'>





[Back to overview of oci_object_storage_bucket](#attributes)

### defined_tags<a name='oci_object_storage_bucket_defined_tags'>

  Defined tags for this resource. Each key is predefined and scoped to a namespace.
For more information, see [Resource Tags](https://docs.cloud.oracle.com/Content/General/Concepts/resourcetags.htm).
Example: `{"Operations": {"CostCenter": "42"}}`

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_object_storage_bucket](#attributes)

### disable_corrective_change<a name='oci_object_storage_bucket_disable_corrective_change'>

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



[Back to overview of oci_object_storage_bucket](#attributes)

### disable_corrective_ensure<a name='oci_object_storage_bucket_disable_corrective_ensure'>

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



[Back to overview of oci_object_storage_bucket](#attributes)

### ensure<a name='oci_object_storage_bucket_ensure'>

The basic property that the resource should be in.

Valid values are `present`, `absent`. 

[Back to overview of oci_object_storage_bucket](#attributes)

### etag<a name='oci_object_storage_bucket_etag'>





[Back to overview of oci_object_storage_bucket](#attributes)

### freeform_tags<a name='oci_object_storage_bucket_freeform_tags'>

  Free-form tags for this resource. Each tag is a simple key-value pair with no predefined name, type, or namespace.
For more information, see [Resource Tags](https://docs.cloud.oracle.com/Content/General/Concepts/resourcetags.htm).
Example: `{"Department": "Finance"}`

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_object_storage_bucket](#attributes)

### id<a name='oci_object_storage_bucket_id'>

The OCID of the resource. This is a read-only property.

This documentation is generated from the Ruby OCI SDK.



[Back to overview of oci_object_storage_bucket](#attributes)

### is_read_only<a name='oci_object_storage_bucket_is_read_only'>





[Back to overview of oci_object_storage_bucket](#attributes)

### kms_key<a name='oci_object_storage_bucket_kms_key'>

The Puppet name of the resource identified by `kms_key_id`.

See the documentation of kms_key_id for all details.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_object_storage_bucket](#attributes)

### kms_key_id<a name='oci_object_storage_bucket_kms_key_id'>

  The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of a master encryption key used to call the Key
Management service to generate a data encryption key or to encrypt or decrypt a data encryption key.
  Rather use the property `kms_key` instead of a direct OCID reference.

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_object_storage_bucket](#attributes)

### metadata<a name='oci_object_storage_bucket_metadata'>

Arbitrary string, up to 4KB, of keys and values for user-defined metadata.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_object_storage_bucket](#attributes)

### name<a name='oci_object_storage_bucket_name'>

The full name of the object.



[Back to overview of oci_object_storage_bucket](#attributes)

### namespace<a name='oci_object_storage_bucket_namespace'>





[Back to overview of oci_object_storage_bucket](#attributes)

### object_events_enabled<a name='oci_object_storage_bucket_object_events_enabled'>

  Whether or not events are emitted for object state changes in this bucket. By default, `objectEventsEnabled` is
set to `false`. Set `objectEventsEnabled` to `true` to emit events for object state changes. For more information
about events, see [Overview of Events](https://docs.cloud.oracle.com/Content/Events/Concepts/eventsoverview.htm).

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_object_storage_bucket](#attributes)

### object_lifecycle_policy_etag<a name='oci_object_storage_bucket_object_lifecycle_policy_etag'>





[Back to overview of oci_object_storage_bucket](#attributes)

### oci_timeout<a name='oci_object_storage_bucket_oci_timeout'>

The maximum time to wait for the OCI resource to be in the ready state.



[Back to overview of oci_object_storage_bucket](#attributes)

### oci_wait_interval<a name='oci_object_storage_bucket_oci_wait_interval'>

The interval beween calls to OCI to check if a resource is in the ready state.



[Back to overview of oci_object_storage_bucket](#attributes)

### present_states<a name='oci_object_storage_bucket_present_states'>

The OCI states, puppet will detect as the resource being present.



[Back to overview of oci_object_storage_bucket](#attributes)

### provider<a name='oci_object_storage_bucket_provider'>

The specific backend to use for this `oci_object_storage_bucket`
resource. You will seldom need to specify this --- Puppet will usually
discover the appropriate provider for your platform.Available providers are:

sdk
: This provider uses the [Oracle Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk) to do its work.



[Back to overview of oci_object_storage_bucket](#attributes)

### public_access_type<a name='oci_object_storage_bucket_public_access_type'>

  The type of public access enabled on this bucket.
A bucket is set to `NoPublicAccess` by default, which only allows an authenticated caller to access the
bucket and its contents. When `ObjectRead` is enabled on the bucket, public access is allowed for the
`GetObject`, `HeadObject`, and `ListObjects` operations. When `ObjectReadWithoutList` is enabled on the bucket,
public access is allowed for the `GetObject` and `HeadObject` operations.

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_object_storage_bucket](#attributes)

### replication_enabled<a name='oci_object_storage_bucket_replication_enabled'>





[Back to overview of oci_object_storage_bucket](#attributes)

### storage_tier<a name='oci_object_storage_bucket_storage_tier'>

  The type of storage tier of this bucket.
A bucket is set to 'Standard' tier by default, which means the bucket will be put in the standard storage tier.
When 'Archive' tier type is set explicitly, the bucket is put in the Archive Storage tier. The 'storageTier'
property is immutable after bucket is created.

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_object_storage_bucket](#attributes)

### synchronized<a name='oci_object_storage_bucket_synchronized'>

Specifies if Puppet waits for OCI actions to be ready before moving on to an other resource.



[Back to overview of oci_object_storage_bucket](#attributes)

### tenant<a name='oci_object_storage_bucket_tenant'>

The tenant for this resource.



[Back to overview of oci_object_storage_bucket](#attributes)

### time_created<a name='oci_object_storage_bucket_time_created'>





[Back to overview of oci_object_storage_bucket](#attributes)
