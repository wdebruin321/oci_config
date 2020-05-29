---
title: oci file storage file system
keywords: documentation
layout: documentation
sidebar: oci_config_sidebar
toc: false
---
## Overview

  An NFS file system. To allow access to a file system, add it
to an export set and associate the export set with a mount
target. The same file system can be in multiple export sets and
associated with multiple mount targets.

To use any of the API operations, you must be authorized in an
IAM policy. If you're not authorized, talk to an
administrator. If you're an administrator who needs to write
policies to give users access, see [Getting Started with
Policies](https://docs.cloud.oracle.com/Content/Identity/Concepts/policygetstarted.htm).

**Warning:** Oracle recommends that you avoid using any confidential information when you supply string values using the API.

  Here is an example on how to use this:

    oci_file_storage_file_system { 'tenant (root)/my_file_system':
      ensure              => 'present',
      availability_domain => 'arMl:EU-FRANKFURT-1-AD-1',
    }

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).

## Attributes



Attribute Name                                                                       | Short Description                                                                            |
------------------------------------------------------------------------------------ | -------------------------------------------------------------------------------------------- |
[absent_states](#oci_file_storage_file_system_absent_states)                         | The OCI states, puppet will detect as the resource being absent.                             |
[availability_domain](#oci_file_storage_file_system_availability_domain)             |   The availability domain to create the file system in.                                      |
[compartment](#oci_file_storage_file_system_compartment)                             | The Puppet name of the resource identified by `compartment_id`.                              |
[compartment_id](#oci_file_storage_file_system_compartment_id)                       | The OCID of the compartment that contains the object.                                        |
[defined_tags](#oci_file_storage_file_system_defined_tags)                           |   Defined tags for this resource.                                                            |
[disable_corrective_change](#oci_file_storage_file_system_disable_corrective_change) | Disable the modification of a resource when Puppet decides it is a corrective change.        |
[disable_corrective_ensure](#oci_file_storage_file_system_disable_corrective_ensure) | Disable the creation or removal of a resource when Puppet decides is a corrective change.    |
[ensure](#oci_file_storage_file_system_ensure)                                       | The basic property that the resource should be in.                                           |
[file_system_name](#oci_file_storage_file_system_file_system_name)                   | The name of the file_system.                                                                 |
[freeform_tags](#oci_file_storage_file_system_freeform_tags)                         |   Free-form tags for this resource.                                                          |
[id](#oci_file_storage_file_system_id)                                               | The OCID of the resource.                                                                    |
[kms_key](#oci_file_storage_file_system_kms_key)                                     | The Puppet name of the resource identified by `kms_key_id`.                                  |
[kms_key_id](#oci_file_storage_file_system_kms_key_id)                               | The OCID of KMS key used to encrypt the encryption keys associated with this file system.    |
[lifecycle_state](#oci_file_storage_file_system_lifecycle_state)                     | The current state of the file system.                                                        |
[metered_bytes](#oci_file_storage_file_system_metered_bytes)                         | any snapshots.                                                                               |
[name](#oci_file_storage_file_system_name)                                           | The full name of the object.                                                                 |
[oci_timeout](#oci_file_storage_file_system_oci_timeout)                             | The maximum time to wait for the OCI resource to be in the ready state.                      |
[oci_wait_interval](#oci_file_storage_file_system_oci_wait_interval)                 | The interval beween calls to OCI to check if a resource is in the ready state.               |
[present_states](#oci_file_storage_file_system_present_states)                       | The OCI states, puppet will detect as the resource being present.                            |
[provider](#oci_file_storage_file_system_provider)                                   | resource.                                                                                    |
[synchronized](#oci_file_storage_file_system_synchronized)                           | Specifies if Puppet waits for OCI actions to be ready before moving on to an other resource. |
[tenant](#oci_file_storage_file_system_tenant)                                       | The tenant for this resource.                                                                |
[time_created](#oci_file_storage_file_system_time_created)                           | [RFC 3339](https://tools.ietf.org/rfc/rfc3339) timestamp format.                             |




### absent_states<a name='oci_file_storage_file_system_absent_states'>

The OCI states, puppet will detect as the resource being absent.



[Back to overview of oci_file_storage_file_system](#attributes)

### availability_domain<a name='oci_file_storage_file_system_availability_domain'>

  The availability domain to create the file system in.

Example: `Uocm:PHX-AD-1`

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_file_storage_file_system](#attributes)

### compartment<a name='oci_file_storage_file_system_compartment'>

The Puppet name of the resource identified by `compartment_id`.

See the documentation of compartment_id for all details.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_file_storage_file_system](#attributes)

### compartment_id<a name='oci_file_storage_file_system_compartment_id'>

The OCID of the compartment that contains the object.

Rather use the property `compartment` instead of a direct OCID reference.

This documentation is generated from the Ruby OCI SDK.



[Back to overview of oci_file_storage_file_system](#attributes)

### defined_tags<a name='oci_file_storage_file_system_defined_tags'>

  Defined tags for this resource. Each key is predefined and scoped to a namespace.
For more information, see [Resource Tags](https://docs.cloud.oracle.com/Content/General/Concepts/resourcetags.htm).
Example: `{"Operations": {"CostCenter": "42"}}`

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_file_storage_file_system](#attributes)

### disable_corrective_change<a name='oci_file_storage_file_system_disable_corrective_change'>

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



[Back to overview of oci_file_storage_file_system](#attributes)

### disable_corrective_ensure<a name='oci_file_storage_file_system_disable_corrective_ensure'>

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



[Back to overview of oci_file_storage_file_system](#attributes)

### ensure<a name='oci_file_storage_file_system_ensure'>

The basic property that the resource should be in.

Valid values are `present`, `absent`. 

[Back to overview of oci_file_storage_file_system](#attributes)

### file_system_name<a name='oci_file_storage_file_system_file_system_name'>

The name of the file_system.



[Back to overview of oci_file_storage_file_system](#attributes)

### freeform_tags<a name='oci_file_storage_file_system_freeform_tags'>

  Free-form tags for this resource. Each tag is a simple key-value pair
 with no predefined name, type, or namespace.
For more information, see [Resource Tags](https://docs.cloud.oracle.com/Content/General/Concepts/resourcetags.htm).
Example: `{"Department": "Finance"}`

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_file_storage_file_system](#attributes)

### id<a name='oci_file_storage_file_system_id'>

The OCID of the resource. This is a read-only property.

This documentation is generated from the Ruby OCI SDK.



[Back to overview of oci_file_storage_file_system](#attributes)

### kms_key<a name='oci_file_storage_file_system_kms_key'>

The Puppet name of the resource identified by `kms_key_id`.

See the documentation of kms_key_id for all details.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_file_storage_file_system](#attributes)

### kms_key_id<a name='oci_file_storage_file_system_kms_key_id'>

The OCID of KMS key used to encrypt the encryption keys associated with this file system.
Rather use the property `kms_key` instead of a direct OCID reference.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_file_storage_file_system](#attributes)

### lifecycle_state<a name='oci_file_storage_file_system_lifecycle_state'>

The current state of the file system.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_file_storage_file_system](#attributes)

### metered_bytes<a name='oci_file_storage_file_system_metered_bytes'>

  The number of bytes consumed by the file system, including
any snapshots. This number reflects the metered size of the file
system and is updated asynchronously with respect to
updates to the file system.

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_file_storage_file_system](#attributes)

### name<a name='oci_file_storage_file_system_name'>

The full name of the object.



[Back to overview of oci_file_storage_file_system](#attributes)

### oci_timeout<a name='oci_file_storage_file_system_oci_timeout'>

The maximum time to wait for the OCI resource to be in the ready state.



[Back to overview of oci_file_storage_file_system](#attributes)

### oci_wait_interval<a name='oci_file_storage_file_system_oci_wait_interval'>

The interval beween calls to OCI to check if a resource is in the ready state.



[Back to overview of oci_file_storage_file_system](#attributes)

### present_states<a name='oci_file_storage_file_system_present_states'>

The OCI states, puppet will detect as the resource being present.



[Back to overview of oci_file_storage_file_system](#attributes)

### provider<a name='oci_file_storage_file_system_provider'>

The specific backend to use for this `oci_file_storage_file_system`
resource. You will seldom need to specify this --- Puppet will usually
discover the appropriate provider for your platform.Available providers are:

sdk
: This provider uses the [Oracle Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk) to do its work.



[Back to overview of oci_file_storage_file_system](#attributes)

### synchronized<a name='oci_file_storage_file_system_synchronized'>

Specifies if Puppet waits for OCI actions to be ready before moving on to an other resource.



[Back to overview of oci_file_storage_file_system](#attributes)

### tenant<a name='oci_file_storage_file_system_tenant'>

The tenant for this resource.



[Back to overview of oci_file_storage_file_system](#attributes)

### time_created<a name='oci_file_storage_file_system_time_created'>

  The date and time the file system was created, expressed in
[RFC 3339](https://tools.ietf.org/rfc/rfc3339) timestamp format.

Example: `2016-08-25T21:10:29.600Z`

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_file_storage_file_system](#attributes)
