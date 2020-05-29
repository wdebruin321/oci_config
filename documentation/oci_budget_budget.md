---
title: oci budget budget
keywords: documentation
layout: documentation
sidebar: oci_config_sidebar
toc: false
---
## Overview

A budget.

Here is an example on how to use this:

    oci_budget_budget { 'tenant (root)/test_budget':
      ensure             => 'present',
      amount             => 100.0,
      description        => 'test Budget',
    }

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).

## Attributes



Attribute Name                                                            | Short Description                                                                                 |
------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------- |
[absent_states](#oci_budget_budget_absent_states)                         | The OCI states, puppet will detect as the resource being absent.                                  |
[actual_spend](#oci_budget_budget_actual_spend)                           | The actual spend in currency for the current budget cycle
                                        |
[alert_rule_count](#oci_budget_budget_alert_rule_count)                   | Total number of alert rules in the budget
                                                        |
[amount](#oci_budget_budget_amount)                                       | The amount of the budget expressed as a whole number in the currency of the customer's rate card. |
[budget_name](#oci_budget_budget_budget_name)                             | The name of the budget.                                                                           |
[compartment](#oci_budget_budget_compartment)                             | The Puppet name of the resource identified by `compartment_id`.                                   |
[compartment_id](#oci_budget_budget_compartment_id)                       | The OCID of the compartment that contains the object.                                             |
[defined_tags](#oci_budget_budget_defined_tags)                           |   Defined tags for this resource.                                                                 |
[description](#oci_budget_budget_description)                             | The description of the budget.                                                                    |
[disable_corrective_change](#oci_budget_budget_disable_corrective_change) | Disable the modification of a resource when Puppet decides it is a corrective change.             |
[disable_corrective_ensure](#oci_budget_budget_disable_corrective_ensure) | Disable the creation or removal of a resource when Puppet decides is a corrective change.         |
[ensure](#oci_budget_budget_ensure)                                       | The basic property that the resource should be in.                                                |
[forecasted_spend](#oci_budget_budget_forecasted_spend)                   | The forecasted spend in currency by the end of the current budget cycle
                          |
[freeform_tags](#oci_budget_budget_freeform_tags)                         |   Free-form tags for this resource.                                                               |
[id](#oci_budget_budget_id)                                               | The OCID of the resource.                                                                         |
[lifecycle_state](#oci_budget_budget_lifecycle_state)                     | The current state of the budget.                                                                  |
[name](#oci_budget_budget_name)                                           | The full name of the object.                                                                      |
[oci_timeout](#oci_budget_budget_oci_timeout)                             | The maximum time to wait for the OCI resource to be in the ready state.                           |
[oci_wait_interval](#oci_budget_budget_oci_wait_interval)                 | The interval beween calls to OCI to check if a resource is in the ready state.                    |
[present_states](#oci_budget_budget_present_states)                       | The OCI states, puppet will detect as the resource being present.                                 |
[provider](#oci_budget_budget_provider)                                   | resource.                                                                                         |
[reset_period](#oci_budget_budget_reset_period)                           | The reset period for the budget.                                                                  |
[synchronized](#oci_budget_budget_synchronized)                           | Specifies if Puppet waits for OCI actions to be ready before moving on to an other resource.      |
[target_type](#oci_budget_budget_target_type)                             | The type of target on which the budget is applied.                                                |
[targets](#oci_budget_budget_targets)                                     |   The list of targets on which the budget is applied.                                             |
[tenant](#oci_budget_budget_tenant)                                       | The tenant for this resource.                                                                     |
[time_created](#oci_budget_budget_time_created)                           | Time that budget was created
                                                                     |
[time_spend_computed](#oci_budget_budget_time_spend_computed)             | The time that the budget spend was last computed
                                                 |
[time_updated](#oci_budget_budget_time_updated)                           | Time that budget was updated
                                                                     |
[version](#oci_budget_budget_version)                                     | Version of the budget.                                                                            |




### absent_states<a name='oci_budget_budget_absent_states'>

The OCI states, puppet will detect as the resource being absent.



[Back to overview of oci_budget_budget](#attributes)

### actual_spend<a name='oci_budget_budget_actual_spend'>

The actual spend in currency for the current budget cycle

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_budget_budget](#attributes)

### alert_rule_count<a name='oci_budget_budget_alert_rule_count'>

Total number of alert rules in the budget

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_budget_budget](#attributes)

### amount<a name='oci_budget_budget_amount'>

The amount of the budget expressed as a whole number in the currency of the customer's rate card.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_budget_budget](#attributes)

### budget_name<a name='oci_budget_budget_budget_name'>

The name of the budget.



[Back to overview of oci_budget_budget](#attributes)

### compartment<a name='oci_budget_budget_compartment'>

The Puppet name of the resource identified by `compartment_id`.

See the documentation of compartment_id for all details.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_budget_budget](#attributes)

### compartment_id<a name='oci_budget_budget_compartment_id'>

The OCID of the compartment that contains the object.

Rather use the property `compartment` instead of a direct OCID reference.

This documentation is generated from the Ruby OCI SDK.



[Back to overview of oci_budget_budget](#attributes)

### defined_tags<a name='oci_budget_budget_defined_tags'>

  Defined tags for this resource. Each key is predefined and scoped to a namespace.
For more information, see [Resource Tags](https://docs.cloud.oracle.com/Content/General/Concepts/resourcetags.htm).

Example: `{"Operations": {"CostCenter": "42"}}`

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_budget_budget](#attributes)

### description<a name='oci_budget_budget_description'>

The description of the budget.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_budget_budget](#attributes)

### disable_corrective_change<a name='oci_budget_budget_disable_corrective_change'>

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



[Back to overview of oci_budget_budget](#attributes)

### disable_corrective_ensure<a name='oci_budget_budget_disable_corrective_ensure'>

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



[Back to overview of oci_budget_budget](#attributes)

### ensure<a name='oci_budget_budget_ensure'>

The basic property that the resource should be in.

Valid values are `present`, `absent`. 

[Back to overview of oci_budget_budget](#attributes)

### forecasted_spend<a name='oci_budget_budget_forecasted_spend'>

The forecasted spend in currency by the end of the current budget cycle

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_budget_budget](#attributes)

### freeform_tags<a name='oci_budget_budget_freeform_tags'>

  Free-form tags for this resource. Each tag is a simple key-value pair with no predefined name, type, or namespace.
For more information, see [Resource Tags](https://docs.cloud.oracle.com/Content/General/Concepts/resourcetags.htm).

Example: `{"Department": "Finance"}`

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_budget_budget](#attributes)

### id<a name='oci_budget_budget_id'>

The OCID of the resource. This is a read-only property.

This documentation is generated from the Ruby OCI SDK.



[Back to overview of oci_budget_budget](#attributes)

### lifecycle_state<a name='oci_budget_budget_lifecycle_state'>

The current state of the budget.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_budget_budget](#attributes)

### name<a name='oci_budget_budget_name'>

The full name of the object.



[Back to overview of oci_budget_budget](#attributes)

### oci_timeout<a name='oci_budget_budget_oci_timeout'>

The maximum time to wait for the OCI resource to be in the ready state.



[Back to overview of oci_budget_budget](#attributes)

### oci_wait_interval<a name='oci_budget_budget_oci_wait_interval'>

The interval beween calls to OCI to check if a resource is in the ready state.



[Back to overview of oci_budget_budget](#attributes)

### present_states<a name='oci_budget_budget_present_states'>

The OCI states, puppet will detect as the resource being present.



[Back to overview of oci_budget_budget](#attributes)

### provider<a name='oci_budget_budget_provider'>

The specific backend to use for this `oci_budget_budget`
resource. You will seldom need to specify this --- Puppet will usually
discover the appropriate provider for your platform.Available providers are:

sdk
: This provider uses the [Oracle Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk) to do its work.



[Back to overview of oci_budget_budget](#attributes)

### reset_period<a name='oci_budget_budget_reset_period'>

The reset period for the budget.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_budget_budget](#attributes)

### synchronized<a name='oci_budget_budget_synchronized'>

Specifies if Puppet waits for OCI actions to be ready before moving on to an other resource.



[Back to overview of oci_budget_budget](#attributes)

### target_type<a name='oci_budget_budget_target_type'>

The type of target on which the budget is applied.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_budget_budget](#attributes)

### targets<a name='oci_budget_budget_targets'>

  The list of targets on which the budget is applied.
  If targetType is "COMPARTMENT", targets contains list of compartment OCIDs.
  If targetType is "TAG", targets contains list of tag identifiers in the form of "{tagNamespace}.{tagKey}.{tagValue}".
Curerntly, the array should contain EXACT ONE item.

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_budget_budget](#attributes)

### tenant<a name='oci_budget_budget_tenant'>

The tenant for this resource.



[Back to overview of oci_budget_budget](#attributes)

### time_created<a name='oci_budget_budget_time_created'>

Time that budget was created

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_budget_budget](#attributes)

### time_spend_computed<a name='oci_budget_budget_time_spend_computed'>

The time that the budget spend was last computed

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_budget_budget](#attributes)

### time_updated<a name='oci_budget_budget_time_updated'>

Time that budget was updated

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_budget_budget](#attributes)

### version<a name='oci_budget_budget_version'>

Version of the budget. Starts from 1 and increments by 1.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_budget_budget](#attributes)
