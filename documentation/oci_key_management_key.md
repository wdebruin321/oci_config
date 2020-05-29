---
title: oci key management key
keywords: documentation
layout: documentation
sidebar: oci_config_sidebar
toc: false
---
## Overview

An encryption key.

Here is an example on how to use this:

    oci_key_management_key { 'tenant (root)/my_key}':
      ensure    => 'present',
      vault     => 'my_compartmentt/my_vault',
      key_shape =>  {
        algorithm => 'AES',
        length    => 16,
      },
    }

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).

## Attributes



Attribute Name                                                                 | Short Description                                                                            |
------------------------------------------------------------------------------ | -------------------------------------------------------------------------------------------- |
[absent_states](#oci_key_management_key_absent_states)                         | The OCI states, puppet will detect as the resource being absent.                             |
[compartment](#oci_key_management_key_compartment)                             | The Puppet name of the resource identified by `compartment_id`.                              |
[compartment_id](#oci_key_management_key_compartment_id)                       | The OCID of the compartment that contains the object.                                        |
[current_key_version](#oci_key_management_key_current_key_version)             | 
                                                                                            |
[defined_tags](#oci_key_management_key_defined_tags)                           |   Defined tags for this resource.                                                            |
[disable_corrective_change](#oci_key_management_key_disable_corrective_change) | Disable the modification of a resource when Puppet decides it is a corrective change.        |
[disable_corrective_ensure](#oci_key_management_key_disable_corrective_ensure) | Disable the creation or removal of a resource when Puppet decides is a corrective change.    |
[ensure](#oci_key_management_key_ensure)                                       | The basic property that the resource should be in.                                           |
[freeform_tags](#oci_key_management_key_freeform_tags)                         |   Free-form tags for this resource.                                                          |
[id](#oci_key_management_key_id)                                               | The OCID of the resource.                                                                    |
[key_name](#oci_key_management_key_key_name)                                   | The name of the key.                                                                         |
[key_shape](#oci_key_management_key_key_shape)                                 | This attribute is required.                                                                  |
[lifecycle_state](#oci_key_management_key_lifecycle_state)                     | 
                                                                                            |
[name](#oci_key_management_key_name)                                           | The full name of the object.                                                                 |
[oci_timeout](#oci_key_management_key_oci_timeout)                             | The maximum time to wait for the OCI resource to be in the ready state.                      |
[oci_wait_interval](#oci_key_management_key_oci_wait_interval)                 | The interval beween calls to OCI to check if a resource is in the ready state.               |
[present_states](#oci_key_management_key_present_states)                       | The OCI states, puppet will detect as the resource being present.                            |
[provider](#oci_key_management_key_provider)                                   | resource.                                                                                    |
[synchronized](#oci_key_management_key_synchronized)                           | Specifies if Puppet waits for OCI actions to be ready before moving on to an other resource. |
[tenant](#oci_key_management_key_tenant)                                       | The tenant for this resource.                                                                |
[time_created](#oci_key_management_key_time_created)                           | 
                                                                                            |
[time_of_deletion](#oci_key_management_key_time_of_deletion)                   | 
                                                                                            |
[vault](#oci_key_management_key_vault)                                         | 
                                                                                            |
[vault_id](#oci_key_management_key_vault_id)                                   | 
                                                                                            |




### absent_states<a name='oci_key_management_key_absent_states'>

The OCI states, puppet will detect as the resource being absent.



[Back to overview of oci_key_management_key](#attributes)

### compartment<a name='oci_key_management_key_compartment'>

The Puppet name of the resource identified by `compartment_id`.

See the documentation of compartment_id for all details.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_key_management_key](#attributes)

### compartment_id<a name='oci_key_management_key_compartment_id'>

The OCID of the compartment that contains the object.

Rather use the property `compartment` instead of a direct OCID reference.

This documentation is generated from the Ruby OCI SDK.



[Back to overview of oci_key_management_key](#attributes)

### current_key_version<a name='oci_key_management_key_current_key_version'>





[Back to overview of oci_key_management_key](#attributes)

### defined_tags<a name='oci_key_management_key_defined_tags'>

  Defined tags for this resource. Each key is predefined and scoped to a namespace.
For more information, see [Resource Tags](https://docs.cloud.oracle.com/Content/General/Concepts/resourcetags.htm).
Example: `{"Operations": {"CostCenter": "42"}}`

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_key_management_key](#attributes)

### disable_corrective_change<a name='oci_key_management_key_disable_corrective_change'>

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



[Back to overview of oci_key_management_key](#attributes)

### disable_corrective_ensure<a name='oci_key_management_key_disable_corrective_ensure'>

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



[Back to overview of oci_key_management_key](#attributes)

### ensure<a name='oci_key_management_key_ensure'>

The basic property that the resource should be in.

Valid values are `present`, `absent`. 

[Back to overview of oci_key_management_key](#attributes)

### freeform_tags<a name='oci_key_management_key_freeform_tags'>

  Free-form tags for this resource. Each tag is a simple key-value pair with no predefined name, type, or namespace.
For more information, see [Resource Tags](https://docs.cloud.oracle.com/Content/General/Concepts/resourcetags.htm).
Example: `{"Department": "Finance"}`

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_key_management_key](#attributes)

### id<a name='oci_key_management_key_id'>

The OCID of the resource. This is a read-only property.

This documentation is generated from the Ruby OCI SDK.



[Back to overview of oci_key_management_key](#attributes)

### key_name<a name='oci_key_management_key_key_name'>

The name of the key.



[Back to overview of oci_key_management_key](#attributes)

### key_shape<a name='oci_key_management_key_key_shape'>

This attribute is required.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_key_management_key](#attributes)

### lifecycle_state<a name='oci_key_management_key_lifecycle_state'>





[Back to overview of oci_key_management_key](#attributes)

### name<a name='oci_key_management_key_name'>

The full name of the object.



[Back to overview of oci_key_management_key](#attributes)

### oci_timeout<a name='oci_key_management_key_oci_timeout'>

The maximum time to wait for the OCI resource to be in the ready state.



[Back to overview of oci_key_management_key](#attributes)

### oci_wait_interval<a name='oci_key_management_key_oci_wait_interval'>

The interval beween calls to OCI to check if a resource is in the ready state.



[Back to overview of oci_key_management_key](#attributes)

### present_states<a name='oci_key_management_key_present_states'>

The OCI states, puppet will detect as the resource being present.



[Back to overview of oci_key_management_key](#attributes)

### provider<a name='oci_key_management_key_provider'>

The specific backend to use for this `oci_key_management_key`
resource. You will seldom need to specify this --- Puppet will usually
discover the appropriate provider for your platform.Available providers are:

sdk
: This provider uses the [Oracle Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk) to do its work.



[Back to overview of oci_key_management_key](#attributes)

### synchronized<a name='oci_key_management_key_synchronized'>

Specifies if Puppet waits for OCI actions to be ready before moving on to an other resource.



[Back to overview of oci_key_management_key](#attributes)

### tenant<a name='oci_key_management_key_tenant'>

The tenant for this resource.



[Back to overview of oci_key_management_key](#attributes)

### time_created<a name='oci_key_management_key_time_created'>





[Back to overview of oci_key_management_key](#attributes)

### time_of_deletion<a name='oci_key_management_key_time_of_deletion'>





[Back to overview of oci_key_management_key](#attributes)

### vault<a name='oci_key_management_key_vault'>





[Back to overview of oci_key_management_key](#attributes)

### vault_id<a name='oci_key_management_key_vault_id'>





[Back to overview of oci_key_management_key](#attributes)
