---
title: oci core public ip
keywords: documentation
layout: documentation
sidebar: oci_config_sidebar
toc: false
---
## Overview

  A *public IP* is a conceptual term that refers to a public IP address and related properties.
The `publicIp` object is the API representation of a public IP.

There are two types of public IPs:
1. Ephemeral
2. Reserved

For more information and comparison of the two types,
see [Public IP Addresses](https://docs.cloud.oracle.com/Content/Network/Tasks/managingpublicIPs.htm).

**Warning:** Oracle recommends that you avoid using any confidential information when you
supply string values using the API.

  Here is an example on how to use this:

      oci_core_public_ip { 'tenant (root)/#my_ip_address':
        ensure   => 'present',
        lifetime => 'RESERVED',
      }

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).

## Attributes



Attribute Name                                                             | Short Description                                                                            |
-------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------- |
[absent_states](#oci_core_public_ip_absent_states)                         | The OCI states, puppet will detect as the resource being absent.                             |
[assigned_entity](#oci_core_public_ip_assigned_entity)                     | The Puppet name of the resource identified by `assigned_entity_id`.                          |
[assigned_entity_id](#oci_core_public_ip_assigned_entity_id)               | being assigned to.                                                                           |
[assigned_entity_type](#oci_core_public_ip_assigned_entity_type)           | assigned to.                                                                                 |
[availability_domain](#oci_core_public_ip_availability_domain)             |   The public IP's availability domain.                                                       |
[compartment](#oci_core_public_ip_compartment)                             | The Puppet name of the resource identified by `compartment_id`.                              |
[compartment_id](#oci_core_public_ip_compartment_id)                       | The OCID of the compartment that contains the object.                                        |
[defined_tags](#oci_core_public_ip_defined_tags)                           |   Defined tags for this resource.                                                            |
[disable_corrective_change](#oci_core_public_ip_disable_corrective_change) | Disable the modification of a resource when Puppet decides it is a corrective change.        |
[disable_corrective_ensure](#oci_core_public_ip_disable_corrective_ensure) | Disable the creation or removal of a resource when Puppet decides is a corrective change.    |
[ensure](#oci_core_public_ip_ensure)                                       | The basic property that the resource should be in.                                           |
[freeform_tags](#oci_core_public_ip_freeform_tags)                         |   Free-form tags for this resource.                                                          |
[id](#oci_core_public_ip_id)                                               | The OCID of the resource.                                                                    |
[ip_address](#oci_core_public_ip_ip_address)                               |   The public IP address of the `publicIp` object.                                            |
[lifecycle_state](#oci_core_public_ip_lifecycle_state)                     | The public IP's current state.                                                               |
[lifetime](#oci_core_public_ip_lifetime)                                   | Infrastructure public IP pool.                                                               |
[name](#oci_core_public_ip_name)                                           | The full name of the object.                                                                 |
[oci_timeout](#oci_core_public_ip_oci_timeout)                             | The maximum time to wait for the OCI resource to be in the ready state.                      |
[oci_wait_interval](#oci_core_public_ip_oci_wait_interval)                 | The interval beween calls to OCI to check if a resource is in the ready state.               |
[present_states](#oci_core_public_ip_present_states)                       | The OCI states, puppet will detect as the resource being present.                            |
[private_ip](#oci_core_public_ip_private_ip)                               | The Puppet name of the resource identified by `private_ip_id`.                               |
[private_ip_id](#oci_core_public_ip_private_ip_id)                         |   The OCID of the private IP to assign the public IP to.                                     |
[provider](#oci_core_public_ip_provider)                                   | resource.                                                                                    |
[public_ip_name](#oci_core_public_ip_public_ip_name)                       | The name of the public_ip.                                                                   |
[scope](#oci_core_public_ip_scope)                                         |   Whether the public IP is regional or specific to a particular availability domain.         |
[synchronized](#oci_core_public_ip_synchronized)                           | Specifies if Puppet waits for OCI actions to be ready before moving on to an other resource. |
[tenant](#oci_core_public_ip_tenant)                                       | The tenant for this resource.                                                                |
[time_created](#oci_core_public_ip_time_created)                           |   The date and time the public IP was created, in the format defined by RFC3339.             |




### absent_states<a name='oci_core_public_ip_absent_states'>

The OCI states, puppet will detect as the resource being absent.



[Back to overview of oci_core_public_ip](#attributes)

### assigned_entity<a name='oci_core_public_ip_assigned_entity'>

The Puppet name of the resource identified by `assigned_entity_id`.

See the documentation of assigned_entity_id for all details.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_public_ip](#attributes)

### assigned_entity_id<a name='oci_core_public_ip_assigned_entity_id'>

  The OCID of the entity the public IP is assigned to, or in the process of
being assigned to.
  Rather use the property `assigned_entity` instead of a direct OCID reference.

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_public_ip](#attributes)

### assigned_entity_type<a name='oci_core_public_ip_assigned_entity_type'>

  The type of entity the public IP is assigned to, or in the process of being
assigned to.

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_public_ip](#attributes)

### availability_domain<a name='oci_core_public_ip_availability_domain'>

  The public IP's availability domain. This property is set only for ephemeral public IPs
that are assigned to a private IP (that is, when the `scope` of the public IP is set to
AVAILABILITY_DOMAIN). The value is the availability domain of the assigned private IP.

Example: `Uocm:PHX-AD-1`

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_public_ip](#attributes)

### compartment<a name='oci_core_public_ip_compartment'>

The Puppet name of the resource identified by `compartment_id`.

See the documentation of compartment_id for all details.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_public_ip](#attributes)

### compartment_id<a name='oci_core_public_ip_compartment_id'>

The OCID of the compartment that contains the object.

Rather use the property `compartment` instead of a direct OCID reference.

This documentation is generated from the Ruby OCI SDK.



[Back to overview of oci_core_public_ip](#attributes)

### defined_tags<a name='oci_core_public_ip_defined_tags'>

  Defined tags for this resource. Each key is predefined and scoped to a
namespace. For more information, see [Resource Tags](https://docs.cloud.oracle.com/Content/General/Concepts/resourcetags.htm).

Example: `{"Operations": {"CostCenter": "42"}}`

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_public_ip](#attributes)

### disable_corrective_change<a name='oci_core_public_ip_disable_corrective_change'>

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



[Back to overview of oci_core_public_ip](#attributes)

### disable_corrective_ensure<a name='oci_core_public_ip_disable_corrective_ensure'>

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



[Back to overview of oci_core_public_ip](#attributes)

### ensure<a name='oci_core_public_ip_ensure'>

The basic property that the resource should be in.

Valid values are `present`, `absent`. 

[Back to overview of oci_core_public_ip](#attributes)

### freeform_tags<a name='oci_core_public_ip_freeform_tags'>

  Free-form tags for this resource. Each tag is a simple key-value pair with no
predefined name, type, or namespace. For more information, see [Resource Tags](https://docs.cloud.oracle.com/Content/General/Concepts/resourcetags.htm).

Example: `{"Department": "Finance"}`

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_public_ip](#attributes)

### id<a name='oci_core_public_ip_id'>

The OCID of the resource. This is a read-only property.

This documentation is generated from the Ruby OCI SDK.



[Back to overview of oci_core_public_ip](#attributes)

### ip_address<a name='oci_core_public_ip_ip_address'>

  The public IP address of the `publicIp` object.

Example: `129.146.2.1`

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_public_ip](#attributes)

### lifecycle_state<a name='oci_core_public_ip_lifecycle_state'>

The public IP's current state.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_public_ip](#attributes)

### lifetime<a name='oci_core_public_ip_lifetime'>

  Defines when the public IP is deleted and released back to the Oracle Cloud
Infrastructure public IP pool. For more information, see
[Public IP Addresses](https://docs.cloud.oracle.com/Content/Network/Tasks/managingpublicIPs.htm).

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_public_ip](#attributes)

### name<a name='oci_core_public_ip_name'>

The full name of the object.



[Back to overview of oci_core_public_ip](#attributes)

### oci_timeout<a name='oci_core_public_ip_oci_timeout'>

The maximum time to wait for the OCI resource to be in the ready state.



[Back to overview of oci_core_public_ip](#attributes)

### oci_wait_interval<a name='oci_core_public_ip_oci_wait_interval'>

The interval beween calls to OCI to check if a resource is in the ready state.



[Back to overview of oci_core_public_ip](#attributes)

### present_states<a name='oci_core_public_ip_present_states'>

The OCI states, puppet will detect as the resource being present.



[Back to overview of oci_core_public_ip](#attributes)

### private_ip<a name='oci_core_public_ip_private_ip'>

The Puppet name of the resource identified by `private_ip_id`.

See the documentation of private_ip_id for all details.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_public_ip](#attributes)

### private_ip_id<a name='oci_core_public_ip_private_ip_id'>

  The OCID of the private IP to assign the public IP to.

Required for an ephemeral public IP because it must always be assigned to a private IP
(specifically a *primary* private IP).

Optional for a reserved public IP. If you don't provide it, the public IP is created but not
assigned to a private IP. You can later assign the public IP with
{#update_public_ip update_public_ip}.
  Rather use the property `private_ip` instead of a direct OCID reference.

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_public_ip](#attributes)

### provider<a name='oci_core_public_ip_provider'>

The specific backend to use for this `oci_core_public_ip`
resource. You will seldom need to specify this --- Puppet will usually
discover the appropriate provider for your platform.Available providers are:

sdk
: This provider uses the [Oracle Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk) to do its work.



[Back to overview of oci_core_public_ip](#attributes)

### public_ip_name<a name='oci_core_public_ip_public_ip_name'>

The name of the public_ip.



[Back to overview of oci_core_public_ip](#attributes)

### scope<a name='oci_core_public_ip_scope'>

  Whether the public IP is regional or specific to a particular availability domain.

* `REGION`: The public IP exists within a region and is assigned to a regional entity
(such as a {NatGateway}), or can be assigned to a private
IP in any availability domain in the region. Reserved public IPs and ephemeral public IPs
assigned to a regional entity have `scope` = `REGION`.

* `AVAILABILITY_DOMAIN`: The public IP exists within the availability domain of the entity
it's assigned to, which is specified by the `availabilityDomain` property of the public IP object.
Ephemeral public IPs that are assigned to private IPs have `scope` = `AVAILABILITY_DOMAIN`.

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_public_ip](#attributes)

### synchronized<a name='oci_core_public_ip_synchronized'>

Specifies if Puppet waits for OCI actions to be ready before moving on to an other resource.



[Back to overview of oci_core_public_ip](#attributes)

### tenant<a name='oci_core_public_ip_tenant'>

The tenant for this resource.



[Back to overview of oci_core_public_ip](#attributes)

### time_created<a name='oci_core_public_ip_time_created'>

  The date and time the public IP was created, in the format defined by RFC3339.

Example: `2016-08-25T21:10:29.600Z`

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_public_ip](#attributes)
