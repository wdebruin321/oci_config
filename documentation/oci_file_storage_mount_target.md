---
title: oci file storage mount target
keywords: documentation
layout: documentation
sidebar: oci_config_sidebar
toc: false
---
## Overview

  Provides access to a collection of file systems through one or more VNICs on a
specified subnet. The set of file systems is controlled through the
referenced export set.

**Warning:** Oracle recommends that you avoid using any confidential information when you supply string values using the API.

  Here is an example on how to use this:

    oci_file_storage_mount_target { 'tenant (root)/my_mount_target':
      ensure              => 'present',
      availability_domain => 'arMl:EU-FRANKFURT-1-AD-1',
      subnet              => 'my_sub_net',
    }

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).

## Attributes



Attribute Name                                                                        | Short Description                                                                                                                                     |
------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------- |
[absent_states](#oci_file_storage_mount_target_absent_states)                         | The OCI states, puppet will detect as the resource being absent.                                                                                      |
[availability_domain](#oci_file_storage_mount_target_availability_domain)             |   The availability domain in which to create the mount target.                                                                                        |
[compartment](#oci_file_storage_mount_target_compartment)                             | The Puppet name of the resource identified by `compartment_id`.                                                                                       |
[compartment_id](#oci_file_storage_mount_target_compartment_id)                       | The OCID of the compartment that contains the object.                                                                                                 |
[defined_tags](#oci_file_storage_mount_target_defined_tags)                           |   Defined tags for this resource.                                                                                                                     |
[disable_corrective_change](#oci_file_storage_mount_target_disable_corrective_change) | Disable the modification of a resource when Puppet decides it is a corrective change.                                                                 |
[disable_corrective_ensure](#oci_file_storage_mount_target_disable_corrective_ensure) | Disable the creation or removal of a resource when Puppet decides is a corrective change.                                                             |
[ensure](#oci_file_storage_mount_target_ensure)                                       | The basic property that the resource should be in.                                                                                                    |
[freeform_tags](#oci_file_storage_mount_target_freeform_tags)                         |   Free-form tags for this resource.                                                                                                                   |
[hostname_label](#oci_file_storage_mount_target_hostname_label)                       | DNS resolution.                                                                                                                                       |
[id](#oci_file_storage_mount_target_id)                                               | The OCID of the resource.                                                                                                                             |
[ip_address](#oci_file_storage_mount_target_ip_address)                               |   A private IP address of your choice.                                                                                                                |
[lifecycle_state](#oci_file_storage_mount_target_lifecycle_state)                     | The current state of the mount target.                                                                                                                |
[mount_target_name](#oci_file_storage_mount_target_mount_target_name)                 | The name of the mount_target.                                                                                                                         |
[name](#oci_file_storage_mount_target_name)                                           | The full name of the object.                                                                                                                          |
[nsg_ids](#oci_file_storage_mount_target_nsg_ids)                                     |   A list of Network Security Group [OCIDs](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) associated with this mount target. |
[nsgs](#oci_file_storage_mount_target_nsgs)                                           | The Puppet name of the resource identified by `nsg_ids`.                                                                                              |
[oci_timeout](#oci_file_storage_mount_target_oci_timeout)                             | The maximum time to wait for the OCI resource to be in the ready state.                                                                               |
[oci_wait_interval](#oci_file_storage_mount_target_oci_wait_interval)                 | The interval beween calls to OCI to check if a resource is in the ready state.                                                                        |
[present_states](#oci_file_storage_mount_target_present_states)                       | The OCI states, puppet will detect as the resource being present.                                                                                     |
[private_ip_ids](#oci_file_storage_mount_target_private_ip_ids)                       | The OCIDs of the private IP addresses associated with this mount target.                                                                              |
[private_ips](#oci_file_storage_mount_target_private_ips)                             | The Puppet name of the resource identified by `private_ip_ids`.                                                                                       |
[provider](#oci_file_storage_mount_target_provider)                                   | resource.                                                                                                                                             |
[subnet](#oci_file_storage_mount_target_subnet)                                       | The Puppet name of the resource identified by `subnet_id`.                                                                                            |
[subnet_id](#oci_file_storage_mount_target_subnet_id)                                 | The OCID of the subnet in which to create the mount target.                                                                                           |
[synchronized](#oci_file_storage_mount_target_synchronized)                           | Specifies if Puppet waits for OCI actions to be ready before moving on to an other resource.                                                          |
[tenant](#oci_file_storage_mount_target_tenant)                                       | The tenant for this resource.                                                                                                                         |
[time_created](#oci_file_storage_mount_target_time_created)                           | in [RFC 3339](https://tools.ietf.org/rfc/rfc3339) timestamp format.                                                                                   |




### absent_states<a name='oci_file_storage_mount_target_absent_states'>

The OCI states, puppet will detect as the resource being absent.



[Back to overview of oci_file_storage_mount_target](#attributes)

### availability_domain<a name='oci_file_storage_mount_target_availability_domain'>

  The availability domain in which to create the mount target.

Example: `Uocm:PHX-AD-1`

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_file_storage_mount_target](#attributes)

### compartment<a name='oci_file_storage_mount_target_compartment'>

The Puppet name of the resource identified by `compartment_id`.

See the documentation of compartment_id for all details.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_file_storage_mount_target](#attributes)

### compartment_id<a name='oci_file_storage_mount_target_compartment_id'>

The OCID of the compartment that contains the object.

Rather use the property `compartment` instead of a direct OCID reference.

This documentation is generated from the Ruby OCI SDK.



[Back to overview of oci_file_storage_mount_target](#attributes)

### defined_tags<a name='oci_file_storage_mount_target_defined_tags'>

  Defined tags for this resource. Each key is predefined and scoped to a namespace.
For more information, see [Resource Tags](https://docs.cloud.oracle.com/Content/General/Concepts/resourcetags.htm).
Example: `{"Operations": {"CostCenter": "42"}}`

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_file_storage_mount_target](#attributes)

### disable_corrective_change<a name='oci_file_storage_mount_target_disable_corrective_change'>

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



[Back to overview of oci_file_storage_mount_target](#attributes)

### disable_corrective_ensure<a name='oci_file_storage_mount_target_disable_corrective_ensure'>

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



[Back to overview of oci_file_storage_mount_target](#attributes)

### ensure<a name='oci_file_storage_mount_target_ensure'>

The basic property that the resource should be in.

Valid values are `present`, `absent`. 

[Back to overview of oci_file_storage_mount_target](#attributes)

### freeform_tags<a name='oci_file_storage_mount_target_freeform_tags'>

  Free-form tags for this resource. Each tag is a simple key-value pair
 with no predefined name, type, or namespace.
For more information, see [Resource Tags](https://docs.cloud.oracle.com/Content/General/Concepts/resourcetags.htm).
Example: `{"Department": "Finance"}`

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_file_storage_mount_target](#attributes)

### hostname_label<a name='oci_file_storage_mount_target_hostname_label'>

  The hostname for the mount target's IP address, used for
DNS resolution. The value is the hostname portion of the private IP
address's fully qualified domain name (FQDN). For example,
`files-1` in the FQDN `files-1.subnet123.vcn1.oraclevcn.com`.
Must be unique across all VNICs in the subnet and comply
with [RFC 952](https://tools.ietf.org/html/rfc952)
and [RFC 1123](https://tools.ietf.org/html/rfc1123).

For more information, see
[DNS in Your Virtual Cloud Network](https://docs.cloud.oracle.com/Content/Network/Concepts/dns.htm).

Example: `files-1`

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_file_storage_mount_target](#attributes)

### id<a name='oci_file_storage_mount_target_id'>

The OCID of the resource. This is a read-only property.

This documentation is generated from the Ruby OCI SDK.



[Back to overview of oci_file_storage_mount_target](#attributes)

### ip_address<a name='oci_file_storage_mount_target_ip_address'>

  A private IP address of your choice. Must be an available IP address within
the subnet's CIDR. If you don't specify a value, Oracle automatically
assigns a private IP address from the subnet.

Example: `10.0.3.3`

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_file_storage_mount_target](#attributes)

### lifecycle_state<a name='oci_file_storage_mount_target_lifecycle_state'>

The current state of the mount target.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_file_storage_mount_target](#attributes)

### mount_target_name<a name='oci_file_storage_mount_target_mount_target_name'>

The name of the mount_target.



[Back to overview of oci_file_storage_mount_target](#attributes)

### name<a name='oci_file_storage_mount_target_name'>

The full name of the object.



[Back to overview of oci_file_storage_mount_target](#attributes)

### nsg_ids<a name='oci_file_storage_mount_target_nsg_ids'>

  A list of Network Security Group [OCIDs](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) associated with this mount target.
A maximum of 5 is allowed.
Setting this to an empty array after the list is created removes the mount target from all NSGs.
For more information about NSGs, see [Security Rules](https://docs.cloud.oracle.com/Content/Network/Concepts/securityrules.htm).
  Rather use the property `nsgs` instead of a direct OCID reference.

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_file_storage_mount_target](#attributes)

### nsgs<a name='oci_file_storage_mount_target_nsgs'>

The Puppet name of the resource identified by `nsg_ids`.

See the documentation of nsg_ids for all details.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_file_storage_mount_target](#attributes)

### oci_timeout<a name='oci_file_storage_mount_target_oci_timeout'>

The maximum time to wait for the OCI resource to be in the ready state.



[Back to overview of oci_file_storage_mount_target](#attributes)

### oci_wait_interval<a name='oci_file_storage_mount_target_oci_wait_interval'>

The interval beween calls to OCI to check if a resource is in the ready state.



[Back to overview of oci_file_storage_mount_target](#attributes)

### present_states<a name='oci_file_storage_mount_target_present_states'>

The OCI states, puppet will detect as the resource being present.



[Back to overview of oci_file_storage_mount_target](#attributes)

### private_ip_ids<a name='oci_file_storage_mount_target_private_ip_ids'>

The OCIDs of the private IP addresses associated with this mount target.
Rather use the property `private_ips` instead of a direct OCID reference.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_file_storage_mount_target](#attributes)

### private_ips<a name='oci_file_storage_mount_target_private_ips'>

The Puppet name of the resource identified by `private_ip_ids`.

See the documentation of private_ip_ids for all details.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_file_storage_mount_target](#attributes)

### provider<a name='oci_file_storage_mount_target_provider'>

The specific backend to use for this `oci_file_storage_mount_target`
resource. You will seldom need to specify this --- Puppet will usually
discover the appropriate provider for your platform.Available providers are:

sdk
: 



[Back to overview of oci_file_storage_mount_target](#attributes)

### subnet<a name='oci_file_storage_mount_target_subnet'>

The Puppet name of the resource identified by `subnet_id`.

See the documentation of subnet_id for all details.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_file_storage_mount_target](#attributes)

### subnet_id<a name='oci_file_storage_mount_target_subnet_id'>

The OCID of the subnet in which to create the mount target.
Rather use the property `subnet` instead of a direct OCID reference.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_file_storage_mount_target](#attributes)

### synchronized<a name='oci_file_storage_mount_target_synchronized'>

Specifies if Puppet waits for OCI actions to be ready before moving on to an other resource.



[Back to overview of oci_file_storage_mount_target](#attributes)

### tenant<a name='oci_file_storage_mount_target_tenant'>

The tenant for this resource.



[Back to overview of oci_file_storage_mount_target](#attributes)

### time_created<a name='oci_file_storage_mount_target_time_created'>

  The date and time the mount target was created, expressed
in [RFC 3339](https://tools.ietf.org/rfc/rfc3339) timestamp format.

Example: `2016-08-25T21:10:29.600Z`

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_file_storage_mount_target](#attributes)
