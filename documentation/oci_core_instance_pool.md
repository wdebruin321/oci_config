---
title: oci core instance pool
keywords: documentation
layout: documentation
sidebar: oci_config_sidebar
toc: false
---
## Overview

  An instance pool is a group of instances within the same region that are created based off of the same
instance configuration. For more information about instance pools and instance configurations, see
[Managing Compute Instances](https://docs.cloud.oracle.com/Content/Compute/Concepts/instancemanagement.htm).

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).

## Attributes



Attribute Name                                                                 | Short Description                                                                            |
------------------------------------------------------------------------------ | -------------------------------------------------------------------------------------------- |
[absent_states](#oci_core_instance_pool_absent_states)                         | The OCI states, puppet will detect as the resource being absent.                             |
[compartment](#oci_core_instance_pool_compartment)                             | The Puppet name of the resource identified by `compartment_id`.                              |
[compartment_id](#oci_core_instance_pool_compartment_id)                       | The OCID of the compartment that contains the object.                                        |
[defined_tags](#oci_core_instance_pool_defined_tags)                           |   Defined tags for this resource.                                                            |
[disable_corrective_change](#oci_core_instance_pool_disable_corrective_change) | Disable the modification of a resource when Puppet decides it is a corrective change.        |
[disable_corrective_ensure](#oci_core_instance_pool_disable_corrective_ensure) | Disable the creation or removal of a resource when Puppet decides is a corrective change.    |
[ensure](#oci_core_instance_pool_ensure)                                       | The basic property that the resource should be in.                                           |
[freeform_tags](#oci_core_instance_pool_freeform_tags)                         |   Free-form tags for this resource.                                                          |
[id](#oci_core_instance_pool_id)                                               | The OCID of the resource.                                                                    |
[instance_configuration](#oci_core_instance_pool_instance_configuration)       | The Puppet name of the resource identified by `instance_configuration_id`.                   |
[instance_configuration_id](#oci_core_instance_pool_instance_configuration_id) | with the instance pool.                                                                      |
[instance_pool_name](#oci_core_instance_pool_instance_pool_name)               | The name of the instance_pool.                                                               |
[lifecycle_state](#oci_core_instance_pool_lifecycle_state)                     | The current state of the instance pool.                                                      |
[load_balancers](#oci_core_instance_pool_load_balancers)                       | The load balancers to attach to the instance pool.                                           |
[name](#oci_core_instance_pool_name)                                           | The full name of the object.                                                                 |
[oci_timeout](#oci_core_instance_pool_oci_timeout)                             | The maximum time to wait for the OCI resource to be in the ready state.                      |
[oci_wait_interval](#oci_core_instance_pool_oci_wait_interval)                 | The interval beween calls to OCI to check if a resource is in the ready state.               |
[placement_configurations](#oci_core_instance_pool_placement_configurations)   |   The placement configurations for the instance pool.                                        |
[present_states](#oci_core_instance_pool_present_states)                       | The OCI states, puppet will detect as the resource being present.                            |
[provider](#oci_core_instance_pool_provider)                                   | resource.                                                                                    |
[size](#oci_core_instance_pool_size)                                           | The number of instances that should be in the instance pool.                                 |
[synchronized](#oci_core_instance_pool_synchronized)                           | Specifies if Puppet waits for OCI actions to be ready before moving on to an other resource. |
[tenant](#oci_core_instance_pool_tenant)                                       | The tenant for this resource.                                                                |
[time_created](#oci_core_instance_pool_time_created)                           |   The date and time the instance pool was created, in the format defined by RFC3339.         |




### absent_states<a name='oci_core_instance_pool_absent_states'>

The OCI states, puppet will detect as the resource being absent.



[Back to overview of oci_core_instance_pool](#attributes)

### compartment<a name='oci_core_instance_pool_compartment'>

The Puppet name of the resource identified by `compartment_id`.

See the documentation of compartment_id for all details.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_instance_pool](#attributes)

### compartment_id<a name='oci_core_instance_pool_compartment_id'>

The OCID of the compartment that contains the object.

Rather use the property `compartment` instead of a direct OCID reference.

This documentation is generated from the Ruby OCI SDK.



[Back to overview of oci_core_instance_pool](#attributes)

### defined_tags<a name='oci_core_instance_pool_defined_tags'>

  Defined tags for this resource. Each key is predefined and scoped to a
namespace. For more information, see [Resource Tags](https://docs.cloud.oracle.com/Content/General/Concepts/resourcetags.htm).

Example: `{"Operations": {"CostCenter": "42"}}`

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_instance_pool](#attributes)

### disable_corrective_change<a name='oci_core_instance_pool_disable_corrective_change'>

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



[Back to overview of oci_core_instance_pool](#attributes)

### disable_corrective_ensure<a name='oci_core_instance_pool_disable_corrective_ensure'>

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



[Back to overview of oci_core_instance_pool](#attributes)

### ensure<a name='oci_core_instance_pool_ensure'>

The basic property that the resource should be in.

Valid values are `present`, `absent`. 

[Back to overview of oci_core_instance_pool](#attributes)

### freeform_tags<a name='oci_core_instance_pool_freeform_tags'>

  Free-form tags for this resource. Each tag is a simple key-value pair with no
predefined name, type, or namespace. For more information, see [Resource Tags](https://docs.cloud.oracle.com/Content/General/Concepts/resourcetags.htm).

Example: `{"Department": "Finance"}`

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_instance_pool](#attributes)

### id<a name='oci_core_instance_pool_id'>

The OCID of the resource. This is a read-only property.

This documentation is generated from the Ruby OCI SDK.



[Back to overview of oci_core_instance_pool](#attributes)

### instance_configuration<a name='oci_core_instance_pool_instance_configuration'>

The Puppet name of the resource identified by `instance_configuration_id`.

See the documentation of instance_configuration_id for all details.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_instance_pool](#attributes)

### instance_configuration_id<a name='oci_core_instance_pool_instance_configuration_id'>

  The [OCID](https://docs.cloud.oracle.com/Content/General/Concepts/identifiers.htm) of the instance configuration associated
with the instance pool.
  Rather use the property `instance_configuration` instead of a direct OCID reference.

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_instance_pool](#attributes)

### instance_pool_name<a name='oci_core_instance_pool_instance_pool_name'>

The name of the instance_pool.



[Back to overview of oci_core_instance_pool](#attributes)

### lifecycle_state<a name='oci_core_instance_pool_lifecycle_state'>

The current state of the instance pool.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_instance_pool](#attributes)

### load_balancers<a name='oci_core_instance_pool_load_balancers'>

The load balancers to attach to the instance pool.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_instance_pool](#attributes)

### name<a name='oci_core_instance_pool_name'>

The full name of the object.



[Back to overview of oci_core_instance_pool](#attributes)

### oci_timeout<a name='oci_core_instance_pool_oci_timeout'>

The maximum time to wait for the OCI resource to be in the ready state.



[Back to overview of oci_core_instance_pool](#attributes)

### oci_wait_interval<a name='oci_core_instance_pool_oci_wait_interval'>

The interval beween calls to OCI to check if a resource is in the ready state.



[Back to overview of oci_core_instance_pool](#attributes)

### placement_configurations<a name='oci_core_instance_pool_placement_configurations'>

  The placement configurations for the instance pool. Provide one placement configuration for
each availability domain.

To use the instance pool with a regional subnet, provide a placement configuration for
each availability domain, and include the regional subnet in each placement
configuration.

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_instance_pool](#attributes)

### present_states<a name='oci_core_instance_pool_present_states'>

The OCI states, puppet will detect as the resource being present.



[Back to overview of oci_core_instance_pool](#attributes)

### provider<a name='oci_core_instance_pool_provider'>

The specific backend to use for this `oci_core_instance_pool`
resource. You will seldom need to specify this --- Puppet will usually
discover the appropriate provider for your platform.Available providers are:

sdk
: 



[Back to overview of oci_core_instance_pool](#attributes)

### size<a name='oci_core_instance_pool_size'>

The number of instances that should be in the instance pool.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_instance_pool](#attributes)

### synchronized<a name='oci_core_instance_pool_synchronized'>

Specifies if Puppet waits for OCI actions to be ready before moving on to an other resource.



[Back to overview of oci_core_instance_pool](#attributes)

### tenant<a name='oci_core_instance_pool_tenant'>

The tenant for this resource.



[Back to overview of oci_core_instance_pool](#attributes)

### time_created<a name='oci_core_instance_pool_time_created'>

  The date and time the instance pool was created, in the format defined by RFC3339.
Example: `2016-08-25T21:10:29.600Z`

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_instance_pool](#attributes)
