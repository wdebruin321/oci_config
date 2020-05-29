---
title: oci core image
keywords: documentation
layout: documentation
sidebar: oci_config_sidebar
toc: false
---
## Overview

  A boot disk image for launching an instance. For more information, see
[Overview of the Compute Service](https://docs.cloud.oracle.com/Content/Compute/Concepts/computeoverview.htm).

To use any of the API operations, you must be authorized in an IAM policy. If you're not authorized,
talk to an administrator. If you're an administrator who needs to write policies to give users access, see
[Getting Started with Policies](https://docs.cloud.oracle.com/Content/Identity/Concepts/policygetstarted.htm).

**Warning:** Oracle recommends that you avoid using any confidential information when you
supply string values using the API.

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).

## Attributes



Attribute Name                                                         | Short Description                                                                            |
---------------------------------------------------------------------- | -------------------------------------------------------------------------------------------- |
[absent_states](#oci_core_image_absent_states)                         | The OCI states, puppet will detect as the resource being absent.                             |
[agent_features](#oci_core_image_agent_features)                       | 
                                                                                            |
[base_image](#oci_core_image_base_image)                               | The Puppet name of the resource identified by `base_image_id`.                               |
[base_image_id](#oci_core_image_base_image_id)                         | The OCID of the image originally used to launch the instance.                                |
[compartment](#oci_core_image_compartment)                             | The Puppet name of the resource identified by `compartment_id`.                              |
[compartment_id](#oci_core_image_compartment_id)                       | The OCID of the compartment that contains the object.                                        |
[create_image_allowed](#oci_core_image_create_image_allowed)           |   Whether instances launched with this image can be used to create new images.               |
[defined_tags](#oci_core_image_defined_tags)                           |   Defined tags for this resource.                                                            |
[disable_corrective_change](#oci_core_image_disable_corrective_change) | Disable the modification of a resource when Puppet decides it is a corrective change.        |
[disable_corrective_ensure](#oci_core_image_disable_corrective_ensure) | Disable the creation or removal of a resource when Puppet decides is a corrective change.    |
[ensure](#oci_core_image_ensure)                                       | The basic property that the resource should be in.                                           |
[freeform_tags](#oci_core_image_freeform_tags)                         |   Free-form tags for this resource.                                                          |
[id](#oci_core_image_id)                                               | The OCID of the resource.                                                                    |
[image_name](#oci_core_image_image_name)                               | The name of the image.                                                                       |
[image_source_details](#oci_core_image_image_source_details)           | Details for creating an image through import
                                                |
[instance](#oci_core_image_instance)                                   | The Puppet name of the resource identified by `instance_id`.                                 |
[instance_id](#oci_core_image_instance_id)                             | The OCID of the instance you want to use as the basis for the image.                         |
[launch_mode](#oci_core_image_launch_mode)                             |   Specifies the configuration mode for launching virtual machine (VM) instances.             |
[launch_options](#oci_core_image_launch_options)                       | 
                                                                                            |
[lifecycle_state](#oci_core_image_lifecycle_state)                     | This attribute is required.                                                                  |
[name](#oci_core_image_name)                                           | The full name of the object.                                                                 |
[oci_timeout](#oci_core_image_oci_timeout)                             | The maximum time to wait for the OCI resource to be in the ready state.                      |
[oci_wait_interval](#oci_core_image_oci_wait_interval)                 | The interval beween calls to OCI to check if a resource is in the ready state.               |
[operating_system](#oci_core_image_operating_system)                   |   The image's operating system.                                                              |
[operating_system_version](#oci_core_image_operating_system_version)   |   The image's operating system version.                                                      |
[present_states](#oci_core_image_present_states)                       | The OCI states, puppet will detect as the resource being present.                            |
[provider](#oci_core_image_provider)                                   | resource.                                                                                    |
[size_in_mbs](#oci_core_image_size_in_mbs)                             |   The boot volume size for an instance launched from this image, (1 MB = 1048576 bytes).     |
[synchronized](#oci_core_image_synchronized)                           | Specifies if Puppet waits for OCI actions to be ready before moving on to an other resource. |
[tenant](#oci_core_image_tenant)                                       | The tenant for this resource.                                                                |
[time_created](#oci_core_image_time_created)                           |   The date and time the image was created, in the format defined by RFC3339.                 |




### absent_states<a name='oci_core_image_absent_states'>

The OCI states, puppet will detect as the resource being absent.



[Back to overview of oci_core_image](#attributes)

### agent_features<a name='oci_core_image_agent_features'>





[Back to overview of oci_core_image](#attributes)

### base_image<a name='oci_core_image_base_image'>

The Puppet name of the resource identified by `base_image_id`.

See the documentation of base_image_id for all details.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_image](#attributes)

### base_image_id<a name='oci_core_image_base_image_id'>

The OCID of the image originally used to launch the instance.
Rather use the property `base_image` instead of a direct OCID reference.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_image](#attributes)

### compartment<a name='oci_core_image_compartment'>

The Puppet name of the resource identified by `compartment_id`.

See the documentation of compartment_id for all details.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_image](#attributes)

### compartment_id<a name='oci_core_image_compartment_id'>

The OCID of the compartment that contains the object.

Rather use the property `compartment` instead of a direct OCID reference.

This documentation is generated from the Ruby OCI SDK.



[Back to overview of oci_core_image](#attributes)

### create_image_allowed<a name='oci_core_image_create_image_allowed'>

  Whether instances launched with this image can be used to create new images.
For example, you cannot create an image of an Oracle Database instance.

Example: `true`

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_image](#attributes)

### defined_tags<a name='oci_core_image_defined_tags'>

  Defined tags for this resource. Each key is predefined and scoped to a
namespace. For more information, see [Resource Tags](https://docs.cloud.oracle.com/Content/General/Concepts/resourcetags.htm).

Example: `{"Operations": {"CostCenter": "42"}}`

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_image](#attributes)

### disable_corrective_change<a name='oci_core_image_disable_corrective_change'>

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



[Back to overview of oci_core_image](#attributes)

### disable_corrective_ensure<a name='oci_core_image_disable_corrective_ensure'>

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



[Back to overview of oci_core_image](#attributes)

### ensure<a name='oci_core_image_ensure'>

The basic property that the resource should be in.

Valid values are `present`, `absent`. 

[Back to overview of oci_core_image](#attributes)

### freeform_tags<a name='oci_core_image_freeform_tags'>

  Free-form tags for this resource. Each tag is a simple key-value pair with no
predefined name, type, or namespace. For more information, see [Resource Tags](https://docs.cloud.oracle.com/Content/General/Concepts/resourcetags.htm).

Example: `{"Department": "Finance"}`

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_image](#attributes)

### id<a name='oci_core_image_id'>

The OCID of the resource. This is a read-only property.

This documentation is generated from the Ruby OCI SDK.



[Back to overview of oci_core_image](#attributes)

### image_name<a name='oci_core_image_image_name'>

The name of the image.



[Back to overview of oci_core_image](#attributes)

### image_source_details<a name='oci_core_image_image_source_details'>

Details for creating an image through import

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_image](#attributes)

### instance<a name='oci_core_image_instance'>

The Puppet name of the resource identified by `instance_id`.

See the documentation of instance_id for all details.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_image](#attributes)

### instance_id<a name='oci_core_image_instance_id'>

The OCID of the instance you want to use as the basis for the image.
Rather use the property `instance` instead of a direct OCID reference.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_image](#attributes)

### launch_mode<a name='oci_core_image_launch_mode'>

  Specifies the configuration mode for launching virtual machine (VM) instances. The configuration modes are:
* `NATIVE` - VM instances launch with paravirtualized boot and VFIO devices. The default value for Oracle-provided images.
* `EMULATED` - VM instances launch with emulated devices, such as the E1000 network driver and emulated SCSI disk controller.
* `PARAVIRTUALIZED` - VM instances launch with paravirtualized devices using virtio drivers.
* `CUSTOM` - VM instances launch with custom configuration settings specified in the `LaunchOptions` parameter.

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_image](#attributes)

### launch_options<a name='oci_core_image_launch_options'>





[Back to overview of oci_core_image](#attributes)

### lifecycle_state<a name='oci_core_image_lifecycle_state'>

This attribute is required.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_image](#attributes)

### name<a name='oci_core_image_name'>

The full name of the object.



[Back to overview of oci_core_image](#attributes)

### oci_timeout<a name='oci_core_image_oci_timeout'>

The maximum time to wait for the OCI resource to be in the ready state.



[Back to overview of oci_core_image](#attributes)

### oci_wait_interval<a name='oci_core_image_oci_wait_interval'>

The interval beween calls to OCI to check if a resource is in the ready state.



[Back to overview of oci_core_image](#attributes)

### operating_system<a name='oci_core_image_operating_system'>

  The image's operating system.

Example: `Oracle Linux`

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_image](#attributes)

### operating_system_version<a name='oci_core_image_operating_system_version'>

  The image's operating system version.

Example: `7.2`

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_image](#attributes)

### present_states<a name='oci_core_image_present_states'>

The OCI states, puppet will detect as the resource being present.



[Back to overview of oci_core_image](#attributes)

### provider<a name='oci_core_image_provider'>

The specific backend to use for this `oci_core_image`
resource. You will seldom need to specify this --- Puppet will usually
discover the appropriate provider for your platform.Available providers are:

sdk
: This provider uses the [Oracle Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk) to do its work.



[Back to overview of oci_core_image](#attributes)

### size_in_mbs<a name='oci_core_image_size_in_mbs'>

  The boot volume size for an instance launched from this image, (1 MB = 1048576 bytes).
Note this is not the same as the size of the image when it was exported or the actual size of the image.

Example: `47694`

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_image](#attributes)

### synchronized<a name='oci_core_image_synchronized'>

Specifies if Puppet waits for OCI actions to be ready before moving on to an other resource.



[Back to overview of oci_core_image](#attributes)

### tenant<a name='oci_core_image_tenant'>

The tenant for this resource.



[Back to overview of oci_core_image](#attributes)

### time_created<a name='oci_core_image_time_created'>

  The date and time the image was created, in the format defined by RFC3339.

Example: `2016-08-25T21:10:29.600Z`

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_image](#attributes)
