---
title: oci identity tag namespace
keywords: documentation
layout: documentation
sidebar: oci_config_sidebar
toc: false
---
## Overview

  A managed container for defined tags. A tag namespace is unique in a tenancy. For more information,
see [Managing Tags and Tag Namespaces](https://docs.cloud.oracle.com/Content/Identity/Concepts/taggingoverview.htm).

**Warning:** Oracle recommends that you avoid using any confidential information when you supply string values
using the API.

  Here is an example on how to use this:

      oci_identity_tag_namespace { 'tenant (root)/my_namespace':
          ensure              => 'present',
          description         => 'my namespace',
        }

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).

## Attributes



Attribute Name                                                                     | Short Description                                                                            |
---------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------- |
[absent_states](#oci_identity_tag_namespace_absent_states)                         | The OCI states, puppet will detect as the resource being absent.                             |
[compartment](#oci_identity_tag_namespace_compartment)                             | The Puppet name of the resource identified by `compartment_id`.                              |
[compartment_id](#oci_identity_tag_namespace_compartment_id)                       | The OCID of the compartment that contains the object.                                        |
[defined_tags](#oci_identity_tag_namespace_defined_tags)                           |   Defined tags for this resource.                                                            |
[description](#oci_identity_tag_namespace_description)                             | The description you assign to the tag namespace during creation.                             |
[disable_corrective_change](#oci_identity_tag_namespace_disable_corrective_change) | Disable the modification of a resource when Puppet decides it is a corrective change.        |
[disable_corrective_ensure](#oci_identity_tag_namespace_disable_corrective_ensure) | Disable the creation or removal of a resource when Puppet decides is a corrective change.    |
[ensure](#oci_identity_tag_namespace_ensure)                                       | The basic property that the resource should be in.                                           |
[freeform_tags](#oci_identity_tag_namespace_freeform_tags)                         |   Free-form tags for this resource.                                                          |
[id](#oci_identity_tag_namespace_id)                                               | The OCID of the resource.                                                                    |
[is_retired](#oci_identity_tag_namespace_is_retired)                               |   Whether the tag namespace is retired.                                                      |
[lifecycle_state](#oci_identity_tag_namespace_lifecycle_state)                     | The tagnamespace's current state.                                                            |
[name](#oci_identity_tag_namespace_name)                                           | The full name of the object.                                                                 |
[oci_timeout](#oci_identity_tag_namespace_oci_timeout)                             | The maximum time to wait for the OCI resource to be in the ready state.                      |
[oci_wait_interval](#oci_identity_tag_namespace_oci_wait_interval)                 | The interval beween calls to OCI to check if a resource is in the ready state.               |
[present_states](#oci_identity_tag_namespace_present_states)                       | The OCI states, puppet will detect as the resource being present.                            |
[provider](#oci_identity_tag_namespace_provider)                                   | resource.                                                                                    |
[synchronized](#oci_identity_tag_namespace_synchronized)                           | Specifies if Puppet waits for OCI actions to be ready before moving on to an other resource. |
[tag_namespace_name](#oci_identity_tag_namespace_tag_namespace_name)               | The name of the tag_namespace.                                                               |
[tenant](#oci_identity_tag_namespace_tenant)                                       | The tenant for this resource.                                                                |
[time_created](#oci_identity_tag_namespace_time_created)                           |   Date and time the tagNamespace was created, in the format defined by RFC3339.              |




### absent_states<a name='oci_identity_tag_namespace_absent_states'>

The OCI states, puppet will detect as the resource being absent.



[Back to overview of oci_identity_tag_namespace](#attributes)

### compartment<a name='oci_identity_tag_namespace_compartment'>

The Puppet name of the resource identified by `compartment_id`.

See the documentation of compartment_id for all details.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_identity_tag_namespace](#attributes)

### compartment_id<a name='oci_identity_tag_namespace_compartment_id'>

The OCID of the compartment that contains the object.

Rather use the property `compartment` instead of a direct OCID reference.

This documentation is generated from the Ruby OCI SDK.



[Back to overview of oci_identity_tag_namespace](#attributes)

### defined_tags<a name='oci_identity_tag_namespace_defined_tags'>

  Defined tags for this resource. Each key is predefined and scoped to a namespace.
For more information, see [Resource Tags](https://docs.cloud.oracle.com/Content/General/Concepts/resourcetags.htm).

Example: `{"Operations": {"CostCenter": "42"}}`

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_identity_tag_namespace](#attributes)

### description<a name='oci_identity_tag_namespace_description'>

The description you assign to the tag namespace during creation.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_identity_tag_namespace](#attributes)

### disable_corrective_change<a name='oci_identity_tag_namespace_disable_corrective_change'>

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



[Back to overview of oci_identity_tag_namespace](#attributes)

### disable_corrective_ensure<a name='oci_identity_tag_namespace_disable_corrective_ensure'>

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



[Back to overview of oci_identity_tag_namespace](#attributes)

### ensure<a name='oci_identity_tag_namespace_ensure'>

The basic property that the resource should be in.

Valid values are `present`, `absent`. 

[Back to overview of oci_identity_tag_namespace](#attributes)

### freeform_tags<a name='oci_identity_tag_namespace_freeform_tags'>

  Free-form tags for this resource. Each tag is a simple key-value pair with no predefined name, type, or namespace.
For more information, see [Resource Tags](https://docs.cloud.oracle.com/Content/General/Concepts/resourcetags.htm).

Example: `{"Department": "Finance"}`

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_identity_tag_namespace](#attributes)

### id<a name='oci_identity_tag_namespace_id'>

The OCID of the resource. This is a read-only property.

This documentation is generated from the Ruby OCI SDK.



[Back to overview of oci_identity_tag_namespace](#attributes)

### is_retired<a name='oci_identity_tag_namespace_is_retired'>

  Whether the tag namespace is retired.
See [Retiring Key Definitions and Namespace Definitions](https://docs.cloud.oracle.com/Content/Identity/Concepts/taggingoverview.htm#Retiring).

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_identity_tag_namespace](#attributes)

### lifecycle_state<a name='oci_identity_tag_namespace_lifecycle_state'>

The tagnamespace's current state. After creating a tagnamespace, make sure its `lifecycleState` is ACTIVE before using it. After retiring a tagnamespace, make sure its `lifecycleState` is INACTIVE before using it.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_identity_tag_namespace](#attributes)

### name<a name='oci_identity_tag_namespace_name'>

The full name of the object.



[Back to overview of oci_identity_tag_namespace](#attributes)

### oci_timeout<a name='oci_identity_tag_namespace_oci_timeout'>

The maximum time to wait for the OCI resource to be in the ready state.



[Back to overview of oci_identity_tag_namespace](#attributes)

### oci_wait_interval<a name='oci_identity_tag_namespace_oci_wait_interval'>

The interval beween calls to OCI to check if a resource is in the ready state.



[Back to overview of oci_identity_tag_namespace](#attributes)

### present_states<a name='oci_identity_tag_namespace_present_states'>

The OCI states, puppet will detect as the resource being present.



[Back to overview of oci_identity_tag_namespace](#attributes)

### provider<a name='oci_identity_tag_namespace_provider'>

The specific backend to use for this `oci_identity_tag_namespace`
resource. You will seldom need to specify this --- Puppet will usually
discover the appropriate provider for your platform.Available providers are:

sdk
: This provider uses the [Oracle Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk) to do its work.



[Back to overview of oci_identity_tag_namespace](#attributes)

### synchronized<a name='oci_identity_tag_namespace_synchronized'>

Specifies if Puppet waits for OCI actions to be ready before moving on to an other resource.



[Back to overview of oci_identity_tag_namespace](#attributes)

### tag_namespace_name<a name='oci_identity_tag_namespace_tag_namespace_name'>

The name of the tag_namespace.



[Back to overview of oci_identity_tag_namespace](#attributes)

### tenant<a name='oci_identity_tag_namespace_tenant'>

The tenant for this resource.



[Back to overview of oci_identity_tag_namespace](#attributes)

### time_created<a name='oci_identity_tag_namespace_time_created'>

  Date and time the tagNamespace was created, in the format defined by RFC3339.
Example: `2016-08-25T21:10:29.600Z`

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_identity_tag_namespace](#attributes)
