---
title: oci autoscaling auto scaling configuration
keywords: documentation
layout: documentation
sidebar: oci_config_sidebar
toc: false
---
## Overview

  An autoscaling configuration allows you to dynamically scale the resources in a Compute instance pool.
For more information, see [Autoscaling](https://docs.cloud.oracle.com/iaas/Content/Compute/Tasks/autoscalinginstancepools.htm).

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).

## Attributes



Attribute Name                                                                                                 | Short Description                                                                               |
-------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------- |
[absent_states](#oci_autoscaling_auto_scaling_configuration_absent_states)                                     | The OCI states, puppet will detect as the resource being absent.                                |
[auto_scaling_configuration_name](#oci_autoscaling_auto_scaling_configuration_auto_scaling_configuration_name) | The name of the auto_scaling_configuration.                                                     |
[compartment](#oci_autoscaling_auto_scaling_configuration_compartment)                                         | The Puppet name of the resource identified by `compartment_id`.                                 |
[compartment_id](#oci_autoscaling_auto_scaling_configuration_compartment_id)                                   | The OCID of the compartment that contains the object.                                           |
[cool_down_in_seconds](#oci_autoscaling_auto_scaling_configuration_cool_down_in_seconds)                       |   The minimum period of time to wait between scaling actions.                                   |
[defined_tags](#oci_autoscaling_auto_scaling_configuration_defined_tags)                                       |   Defined tags for this resource.                                                               |
[disable_corrective_change](#oci_autoscaling_auto_scaling_configuration_disable_corrective_change)             | Disable the modification of a resource when Puppet decides it is a corrective change.           |
[disable_corrective_ensure](#oci_autoscaling_auto_scaling_configuration_disable_corrective_ensure)             | Disable the creation or removal of a resource when Puppet decides is a corrective change.       |
[ensure](#oci_autoscaling_auto_scaling_configuration_ensure)                                                   | The basic property that the resource should be in.                                              |
[freeform_tags](#oci_autoscaling_auto_scaling_configuration_freeform_tags)                                     |   Free-form tags for this resource.                                                             |
[id](#oci_autoscaling_auto_scaling_configuration_id)                                                           | The OCID of the resource.                                                                       |
[instance_pool](#oci_autoscaling_auto_scaling_configuration_instance_pool)                                     | The reference to the instance pool.                                                             |
[instance_pool_id](#oci_autoscaling_auto_scaling_configuration_instance_pool_id)                               | The reference to the instance pool.                                                             |
[is_enabled](#oci_autoscaling_auto_scaling_configuration_is_enabled)                                           | Whether the autoscaling configuration is enabled.                                               |
[name](#oci_autoscaling_auto_scaling_configuration_name)                                                       | The full name of the object.                                                                    |
[oci_timeout](#oci_autoscaling_auto_scaling_configuration_oci_timeout)                                         | The maximum time to wait for the OCI resource to be in the ready state.                         |
[oci_wait_interval](#oci_autoscaling_auto_scaling_configuration_oci_wait_interval)                             | The interval beween calls to OCI to check if a resource is in the ready state.                  |
[policies](#oci_autoscaling_auto_scaling_configuration_policies)                                               | This attribute is required.                                                                     |
[present_states](#oci_autoscaling_auto_scaling_configuration_present_states)                                   | The OCI states, puppet will detect as the resource being present.                               |
[provider](#oci_autoscaling_auto_scaling_configuration_provider)                                               | resource.                                                                                       |
[synchronized](#oci_autoscaling_auto_scaling_configuration_synchronized)                                       | Specifies if Puppet waits for OCI actions to be ready before moving on to an other resource.    |
[tenant](#oci_autoscaling_auto_scaling_configuration_tenant)                                                   | The tenant for this resource.                                                                   |
[time_created](#oci_autoscaling_auto_scaling_configuration_time_created)                                       |   The date and time the AutoScalingConfiguration was created, in the format defined by RFC3339. |




### absent_states<a name='oci_autoscaling_auto_scaling_configuration_absent_states'>

The OCI states, puppet will detect as the resource being absent.



[Back to overview of oci_autoscaling_auto_scaling_configuration](#attributes)

### auto_scaling_configuration_name<a name='oci_autoscaling_auto_scaling_configuration_auto_scaling_configuration_name'>

The name of the auto_scaling_configuration.



[Back to overview of oci_autoscaling_auto_scaling_configuration](#attributes)

### compartment<a name='oci_autoscaling_auto_scaling_configuration_compartment'>

The Puppet name of the resource identified by `compartment_id`.

See the documentation of compartment_id for all details.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_autoscaling_auto_scaling_configuration](#attributes)

### compartment_id<a name='oci_autoscaling_auto_scaling_configuration_compartment_id'>

The OCID of the compartment that contains the object.

Rather use the property `compartment` instead of a direct OCID reference.

This documentation is generated from the Ruby OCI SDK.



[Back to overview of oci_autoscaling_auto_scaling_configuration](#attributes)

### cool_down_in_seconds<a name='oci_autoscaling_auto_scaling_configuration_cool_down_in_seconds'>

  The minimum period of time to wait between scaling actions. The cooldown period gives the system time to stabilize
before rescaling. The minimum value is 300 seconds, which is also the default.

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_autoscaling_auto_scaling_configuration](#attributes)

### defined_tags<a name='oci_autoscaling_auto_scaling_configuration_defined_tags'>

  Defined tags for this resource. Each key is predefined and scoped to a
namespace. For more information, see [Resource Tags](https://docs.cloud.oracle.com/Content/General/Concepts/resourcetags.htm).

Example: `{"Operations": {"CostCenter": "42"}}`

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_autoscaling_auto_scaling_configuration](#attributes)

### disable_corrective_change<a name='oci_autoscaling_auto_scaling_configuration_disable_corrective_change'>

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



[Back to overview of oci_autoscaling_auto_scaling_configuration](#attributes)

### disable_corrective_ensure<a name='oci_autoscaling_auto_scaling_configuration_disable_corrective_ensure'>

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



[Back to overview of oci_autoscaling_auto_scaling_configuration](#attributes)

### ensure<a name='oci_autoscaling_auto_scaling_configuration_ensure'>

The basic property that the resource should be in.

Valid values are `present`, `absent`. 

[Back to overview of oci_autoscaling_auto_scaling_configuration](#attributes)

### freeform_tags<a name='oci_autoscaling_auto_scaling_configuration_freeform_tags'>

  Free-form tags for this resource. Each tag is a simple key-value pair with no
predefined name, type, or namespace. For more information, see [Resource Tags](https://docs.cloud.oracle.com/Content/General/Concepts/resourcetags.htm).

Example: `{"Department": "Finance"}`

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_autoscaling_auto_scaling_configuration](#attributes)

### id<a name='oci_autoscaling_auto_scaling_configuration_id'>

The OCID of the resource. This is a read-only property.

This documentation is generated from the Ruby OCI SDK.



[Back to overview of oci_autoscaling_auto_scaling_configuration](#attributes)

### instance_pool<a name='oci_autoscaling_auto_scaling_configuration_instance_pool'>

The reference to the instance pool. This attribute is required.

In the originla documentation, this properyt is names `resource` ans is a Hash. `resource` however is
a Puppet internal reserved name. So we can't use it. Therefore we name it to what is currently is, a reference
to an instance_pool.



[Back to overview of oci_autoscaling_auto_scaling_configuration](#attributes)

### instance_pool_id<a name='oci_autoscaling_auto_scaling_configuration_instance_pool_id'>

The reference to the instance pool. This attribute is required.

In the originla documentation, this properyt is names `resource` ans is a Hash. `resource` however is
a Puppet internal reserved name. So we can't use it. Therefore we name it to what is currently is, a reference
to an instance_pool.



[Back to overview of oci_autoscaling_auto_scaling_configuration](#attributes)

### is_enabled<a name='oci_autoscaling_auto_scaling_configuration_is_enabled'>

Whether the autoscaling configuration is enabled.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_autoscaling_auto_scaling_configuration](#attributes)

### name<a name='oci_autoscaling_auto_scaling_configuration_name'>

The full name of the object.



[Back to overview of oci_autoscaling_auto_scaling_configuration](#attributes)

### oci_timeout<a name='oci_autoscaling_auto_scaling_configuration_oci_timeout'>

The maximum time to wait for the OCI resource to be in the ready state.



[Back to overview of oci_autoscaling_auto_scaling_configuration](#attributes)

### oci_wait_interval<a name='oci_autoscaling_auto_scaling_configuration_oci_wait_interval'>

The interval beween calls to OCI to check if a resource is in the ready state.



[Back to overview of oci_autoscaling_auto_scaling_configuration](#attributes)

### policies<a name='oci_autoscaling_auto_scaling_configuration_policies'>

This attribute is required.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_autoscaling_auto_scaling_configuration](#attributes)

### present_states<a name='oci_autoscaling_auto_scaling_configuration_present_states'>

The OCI states, puppet will detect as the resource being present.



[Back to overview of oci_autoscaling_auto_scaling_configuration](#attributes)

### provider<a name='oci_autoscaling_auto_scaling_configuration_provider'>

The specific backend to use for this `oci_autoscaling_auto_scaling_configuration`
resource. You will seldom need to specify this --- Puppet will usually
discover the appropriate provider for your platform.Available providers are:

sdk
: This provider uses the [Oracle Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk) to do its work.



[Back to overview of oci_autoscaling_auto_scaling_configuration](#attributes)

### synchronized<a name='oci_autoscaling_auto_scaling_configuration_synchronized'>

Specifies if Puppet waits for OCI actions to be ready before moving on to an other resource.



[Back to overview of oci_autoscaling_auto_scaling_configuration](#attributes)

### tenant<a name='oci_autoscaling_auto_scaling_configuration_tenant'>

The tenant for this resource.



[Back to overview of oci_autoscaling_auto_scaling_configuration](#attributes)

### time_created<a name='oci_autoscaling_auto_scaling_configuration_time_created'>

  The date and time the AutoScalingConfiguration was created, in the format defined by RFC3339.

Example: `2016-08-25T21:10:29.600Z`

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_autoscaling_auto_scaling_configuration](#attributes)
