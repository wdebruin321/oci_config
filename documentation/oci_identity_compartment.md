---
title: oci identity compartment
keywords: documentation
layout: documentation
sidebar: oci_config_sidebar
toc: false
---
## Overview

  A collection of related resources. Compartments are a fundamental component of Oracle Cloud Infrastructure
for organizing and isolating your cloud resources. You use them to clearly separate resources for the purposes
of measuring usage and billing, access (through the use of IAM Service policies), and isolation (separating the
resources for one project or business unit from another). A common approach is to create a compartment for each
major part of your organization. For more information, see
[Overview of the IAM Service](https://docs.cloud.oracle.com/Content/Identity/Concepts/overview.htm) and also
[Setting Up Your Tenancy](https://docs.cloud.oracle.com/Content/GSG/Concepts/settinguptenancy.htm).

To place a resource in a compartment, simply specify the compartment ID in the "Create" request object when
initially creating the resource. For example, to launch an instance into a particular compartment, specify
that compartment's OCID in the `LaunchInstance` request. You can't move an existing resource from one
compartment to another.

To use any of the API operations, you must be authorized in an IAM policy. If you're not authorized,
talk to an administrator. If you're an administrator who needs to write policies to give users access,
see [Getting Started with Policies](https://docs.cloud.oracle.com/Content/Identity/Concepts/policygetstarted.htm).

**Warning:** Oracle recommends that you avoid using any confidential information when you supply string values
using the API.

  Here is an example on how to use this:

    oci_identity_compartment { 'tenant (root)/my_compartment':
      ensure          => 'present',
      description     => 'my own compartment',
    }

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).

## Attributes



Attribute Name                                                                   | Short Description                                                                            |
-------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------- |
[absent_states](#oci_identity_compartment_absent_states)                         | The OCI states, puppet will detect as the resource being absent.                             |
[compartment](#oci_identity_compartment_compartment)                             | The Puppet name of the resource identified by `compartment_id`.                              |
[compartment_id](#oci_identity_compartment_compartment_id)                       | The OCID of the compartment that contains the object.                                        |
[compartment_name](#oci_identity_compartment_compartment_name)                   | The name of the compartment.                                                                 |
[defined_tags](#oci_identity_compartment_defined_tags)                           |   Defined tags for this resource.                                                            |
[description](#oci_identity_compartment_description)                             | The description you assign to the compartment during creation.                               |
[disable_corrective_change](#oci_identity_compartment_disable_corrective_change) | Disable the modification of a resource when Puppet decides it is a corrective change.        |
[disable_corrective_ensure](#oci_identity_compartment_disable_corrective_ensure) | Disable the creation or removal of a resource when Puppet decides is a corrective change.    |
[ensure](#oci_identity_compartment_ensure)                                       | The basic property that the resource should be in.                                           |
[freeform_tags](#oci_identity_compartment_freeform_tags)                         |   Free-form tags for this resource.                                                          |
[id](#oci_identity_compartment_id)                                               | The OCID of the resource.                                                                    |
[inactive_status](#oci_identity_compartment_inactive_status)                     | The detailed status of INACTIVE lifecycleState.                                              |
[is_accessible](#oci_identity_compartment_is_accessible)                         |   Indicates whether or not the compartment is accessible for the user making the request.    |
[lifecycle_state](#oci_identity_compartment_lifecycle_state)                     |   The compartment's current state.                                                           |
[name](#oci_identity_compartment_name)                                           | The full name of the object.                                                                 |
[oci_timeout](#oci_identity_compartment_oci_timeout)                             | The maximum time to wait for the OCI resource to be in the ready state.                      |
[oci_wait_interval](#oci_identity_compartment_oci_wait_interval)                 | The interval beween calls to OCI to check if a resource is in the ready state.               |
[present_states](#oci_identity_compartment_present_states)                       | The OCI states, puppet will detect as the resource being present.                            |
[provider](#oci_identity_compartment_provider)                                   | resource.                                                                                    |
[synchronized](#oci_identity_compartment_synchronized)                           | Specifies if Puppet waits for OCI actions to be ready before moving on to an other resource. |
[tenant](#oci_identity_compartment_tenant)                                       | The tenant for this resource.                                                                |
[time_created](#oci_identity_compartment_time_created)                           |   Date and time the compartment was created, in the format defined by RFC3339.               |




### absent_states<a name='oci_identity_compartment_absent_states'>

The OCI states, puppet will detect as the resource being absent.



[Back to overview of oci_identity_compartment](#attributes)

### compartment<a name='oci_identity_compartment_compartment'>

The Puppet name of the resource identified by `compartment_id`.

See the documentation of compartment_id for all details.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_identity_compartment](#attributes)

### compartment_id<a name='oci_identity_compartment_compartment_id'>

The OCID of the compartment that contains the object.

Rather use the property `compartment` instead of a direct OCID reference.

This documentation is generated from the Ruby OCI SDK.



[Back to overview of oci_identity_compartment](#attributes)

### compartment_name<a name='oci_identity_compartment_compartment_name'>

The name of the compartment.



[Back to overview of oci_identity_compartment](#attributes)

### defined_tags<a name='oci_identity_compartment_defined_tags'>

  Defined tags for this resource. Each key is predefined and scoped to a namespace.
For more information, see [Resource Tags](https://docs.cloud.oracle.com/Content/General/Concepts/resourcetags.htm).
Example: `{"Operations": {"CostCenter": "42"}}`

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_identity_compartment](#attributes)

### description<a name='oci_identity_compartment_description'>

The description you assign to the compartment during creation. Does not have to be unique, and it's changeable.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_identity_compartment](#attributes)

### disable_corrective_change<a name='oci_identity_compartment_disable_corrective_change'>

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



[Back to overview of oci_identity_compartment](#attributes)

### disable_corrective_ensure<a name='oci_identity_compartment_disable_corrective_ensure'>

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



[Back to overview of oci_identity_compartment](#attributes)

### ensure<a name='oci_identity_compartment_ensure'>

The basic property that the resource should be in.

Valid values are `present`, `absent`. 

[Back to overview of oci_identity_compartment](#attributes)

### freeform_tags<a name='oci_identity_compartment_freeform_tags'>

  Free-form tags for this resource. Each tag is a simple key-value pair with no predefined name, type, or namespace.
For more information, see [Resource Tags](https://docs.cloud.oracle.com/Content/General/Concepts/resourcetags.htm).
Example: `{"Department": "Finance"}`

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_identity_compartment](#attributes)

### id<a name='oci_identity_compartment_id'>

The OCID of the resource. This is a read-only property.

This documentation is generated from the Ruby OCI SDK.



[Back to overview of oci_identity_compartment](#attributes)

### inactive_status<a name='oci_identity_compartment_inactive_status'>

The detailed status of INACTIVE lifecycleState.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_identity_compartment](#attributes)

### is_accessible<a name='oci_identity_compartment_is_accessible'>

  Indicates whether or not the compartment is accessible for the user making the request.
Returns true when the user has INSPECT permissions directly on a resource in the
compartment or indirectly (permissions can be on a resource in a subcompartment).

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_identity_compartment](#attributes)

### lifecycle_state<a name='oci_identity_compartment_lifecycle_state'>

  The compartment's current state. After creating a compartment, make sure its `lifecycleState` changes from
CREATING to ACTIVE before using it.

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_identity_compartment](#attributes)

### name<a name='oci_identity_compartment_name'>

The full name of the object.



[Back to overview of oci_identity_compartment](#attributes)

### oci_timeout<a name='oci_identity_compartment_oci_timeout'>

The maximum time to wait for the OCI resource to be in the ready state.



[Back to overview of oci_identity_compartment](#attributes)

### oci_wait_interval<a name='oci_identity_compartment_oci_wait_interval'>

The interval beween calls to OCI to check if a resource is in the ready state.



[Back to overview of oci_identity_compartment](#attributes)

### present_states<a name='oci_identity_compartment_present_states'>

The OCI states, puppet will detect as the resource being present.



[Back to overview of oci_identity_compartment](#attributes)

### provider<a name='oci_identity_compartment_provider'>

The specific backend to use for this `oci_identity_compartment`
resource. You will seldom need to specify this --- Puppet will usually
discover the appropriate provider for your platform.Available providers are:

sdk
: This provider uses the [Oracle Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk) to do its work.



[Back to overview of oci_identity_compartment](#attributes)

### synchronized<a name='oci_identity_compartment_synchronized'>

Specifies if Puppet waits for OCI actions to be ready before moving on to an other resource.



[Back to overview of oci_identity_compartment](#attributes)

### tenant<a name='oci_identity_compartment_tenant'>

The tenant for this resource.



[Back to overview of oci_identity_compartment](#attributes)

### time_created<a name='oci_identity_compartment_time_created'>

  Date and time the compartment was created, in the format defined by RFC3339.

Example: `2016-08-25T21:10:29.600Z`

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_identity_compartment](#attributes)
