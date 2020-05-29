---
title: oci core instance
keywords: documentation
layout: documentation
sidebar: oci_config_sidebar
toc: false
---
## Overview

  A compute host. The image used to launch the instance determines its operating system and other
software. The shape specified during the launch process determines the number of CPUs and memory
allocated to the instance. For more information, see
[Overview of the Compute Service](https://docs.cloud.oracle.com/Content/Compute/Concepts/computeoverview.htm).

To use any of the API operations, you must be authorized in an IAM policy. If you're not authorized,
talk to an administrator. If you're an administrator who needs to write policies to give users access, see
[Getting Started with Policies](https://docs.cloud.oracle.com/Content/Identity/Concepts/policygetstarted.htm).

**Warning:** Oracle recommends that you avoid using any confidential information when you
supply string values using the API.

  Here is an example on how to use this:

    oci_core_instance { 'tenant (root)/my_instance':
      ensure              => 'present',
      availability_domain => 'arMl:EU-FRANKFURT-1-AD-1',
      fault_domain        => 'FAULT-DOMAIN-2',
      image               => 'Oracle-Linux-7.7-2019.12.18-0',
      launch_mode         => 'NATIVE',
      region              => 'eu-frankfurt-1',
      shape               => 'VM.Standard2.1',
      vnics               => {
        'nic1' => {
          'nic_index' => 0,
          'hostname_label' => 'my_host',
          'is_primary' => true,
          'skip_source_dest_check' => true,
          'subnet' => 'Public Subnet'
        }
      },
      volumes             => {
        'data_disk_1' => {
          'attachment_type' => 'paravirtualized',
          'device' => '/dev/oracleoci/oraclevdb',
          'display_name' => 'data_disk_1',
          'is_read_only' => true,
        },
        'data_disk_2' => {
          'attachment_type' => 'paravirtualized',
          'device' => '/dev/oracleoci/oraclevdc',
          'display_name' => 'data_disk_2',
          'is_read_only' => true,
        }
      },
    }

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).

## Attributes



Attribute Name                                                                                | Short Description                                                                                        |
--------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------- |
[absent_states](#oci_core_instance_absent_states)                                             | The OCI states, puppet will detect as the resource being absent.                                         |
[agent_config](#oci_core_instance_agent_config)                                               | 
                                                                                                        |
[attached_volumes](#oci_core_instance_attached_volumes)                                       | The volumes your want ensure are connected to the instance.                                              |
[availability_domain](#oci_core_instance_availability_domain)                                 |   The availability domain of the instance.                                                               |
[boot_volumes](#oci_core_instance_boot_volumes)                                               | 
                                                                                                        |
[compartment](#oci_core_instance_compartment)                                                 | The Puppet name of the resource identified by `compartment_id`.                                          |
[compartment_id](#oci_core_instance_compartment_id)                                           | The OCID of the compartment that contains the object.                                                    |
[dedicated_vm_host](#oci_core_instance_dedicated_vm_host)                                     | The Puppet name of the resource identified by `dedicated_vm_host_id`.                                    |
[dedicated_vm_host_id](#oci_core_instance_dedicated_vm_host_id)                               | The OCID of dedicated VM host.                                                                           |
[defined_tags](#oci_core_instance_defined_tags)                                               |   Defined tags for this resource.                                                                        |
[detached_volumes](#oci_core_instance_detached_volumes)                                       | The volumes your want ensure are detached from  the instance.                                            |
[disable_corrective_change](#oci_core_instance_disable_corrective_change)                     | Disable the modification of a resource when Puppet decides it is a corrective change.                    |
[disable_corrective_ensure](#oci_core_instance_disable_corrective_ensure)                     | Disable the creation or removal of a resource when Puppet decides is a corrective change.                |
[ensure](#oci_core_instance_ensure)                                                           | The basic property that the resource should be in.                                                       |
[extended_metadata](#oci_core_instance_extended_metadata)                                     |   Additional metadata key/value pairs that you provide.                                                  |
[fault_domain](#oci_core_instance_fault_domain)                                               |   A fault domain is a grouping of hardware and infrastructure within an availability domain.             |
[freeform_tags](#oci_core_instance_freeform_tags)                                             |   Free-form tags for this resource.                                                                      |
[id](#oci_core_instance_id)                                                                   | The OCID of the resource.                                                                                |
[instance_name](#oci_core_instance_instance_name)                                             | The name of the instance.                                                                                |
[ipxe_script](#oci_core_instance_ipxe_script)                                                 |   This is an advanced option.                                                                            |
[is_pv_encryption_in_transit_enabled](#oci_core_instance_is_pv_encryption_in_transit_enabled) | Whether to enable in-transit encryption for the data volume's paravirtualized attachment.                |
[launch_mode](#oci_core_instance_launch_mode)                                                 |   Specifies the configuration mode for launching virtual machine (VM) instances.                         |
[launch_options](#oci_core_instance_launch_options)                                           | 
                                                                                                        |
[lifecycle_state](#oci_core_instance_lifecycle_state)                                         | The current state of the instance.                                                                       |
[metadata](#oci_core_instance_metadata)                                                       | required to connect to the instance.                                                                     |
[name](#oci_core_instance_name)                                                               | The full name of the object.                                                                             |
[oci_timeout](#oci_core_instance_oci_timeout)                                                 | The maximum time to wait for the OCI resource to be in the ready state.                                  |
[oci_wait_interval](#oci_core_instance_oci_wait_interval)                                     | The interval beween calls to OCI to check if a resource is in the ready state.                           |
[present_states](#oci_core_instance_present_states)                                           | The OCI states, puppet will detect as the resource being present.                                        |
[provider](#oci_core_instance_provider)                                                       | resource.                                                                                                |
[region](#oci_core_instance_region)                                                           |   The region that contains the availability domain the instance is running in.                           |
[shape](#oci_core_instance_shape)                                                             |   The shape of an instance.                                                                              |
[source_details](#oci_core_instance_source_details)                                           |   Details for creating an instance.                                                                      |
[ssh_authorized_keys](#oci_core_instance_ssh_authorized_keys)                                 |   Provide one or more public SSH keys to be included in the `~/.ssh/authorized_keys` file
               |
[synchronized](#oci_core_instance_synchronized)                                               | Specifies if Puppet waits for OCI actions to be ready before moving on to an other resource.             |
[system_tags](#oci_core_instance_system_tags)                                                 |   System tags for this resource.                                                                         |
[tenant](#oci_core_instance_tenant)                                                           | The tenant for this resource.                                                                            |
[time_created](#oci_core_instance_time_created)                                               |   The date and time the instance was created, in the format defined by RFC3339.                          |
[time_maintenance_reboot_due](#oci_core_instance_time_maintenance_reboot_due)                 |   The date and time the instance is expected to be stopped / started,  in the format defined by RFC3339. |
[user_data](#oci_core_instance_user_data)                                                     | Cloud-Init configuration.                                                                                |
[vnics](#oci_core_instance_vnics)                                                             | 
                                                                                                        |
[volumes](#oci_core_instance_volumes)                                                         |     The volumes connected to the instance.                                                               |




### absent_states<a name='oci_core_instance_absent_states'>

The OCI states, puppet will detect as the resource being absent.



[Back to overview of oci_core_instance](#attributes)

### agent_config<a name='oci_core_instance_agent_config'>





[Back to overview of oci_core_instance](#attributes)

### attached_volumes<a name='oci_core_instance_attached_volumes'>

The volumes your want ensure are connected to the instance. This is different from the
regular `volumes` property in the sense that this is only about the specified
volumes. It doesn't care about any other volumes attached. It doesn't describe the
the full state, but only the partial state of this volume.

Here is an example on how to use this:

    oci_core_instance { 'tenant (root)/my_instance':
      ensure              => 'present',
        .
        .
      attached_volumes             => {
        'compartment_name/my_volume_1' => {
          'attachment_type' => 'paravirtualized',
        }
    }



[Back to overview of oci_core_instance](#attributes)

### availability_domain<a name='oci_core_instance_availability_domain'>

  The availability domain of the instance.

Example: `Uocm:PHX-AD-1`

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_instance](#attributes)

### boot_volumes<a name='oci_core_instance_boot_volumes'>





[Back to overview of oci_core_instance](#attributes)

### compartment<a name='oci_core_instance_compartment'>

The Puppet name of the resource identified by `compartment_id`.

See the documentation of compartment_id for all details.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_instance](#attributes)

### compartment_id<a name='oci_core_instance_compartment_id'>

The OCID of the compartment that contains the object.

Rather use the property `compartment` instead of a direct OCID reference.

This documentation is generated from the Ruby OCI SDK.



[Back to overview of oci_core_instance](#attributes)

### dedicated_vm_host<a name='oci_core_instance_dedicated_vm_host'>

The Puppet name of the resource identified by `dedicated_vm_host_id`.

See the documentation of dedicated_vm_host_id for all details.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_instance](#attributes)

### dedicated_vm_host_id<a name='oci_core_instance_dedicated_vm_host_id'>

The OCID of dedicated VM host.
Rather use the property `dedicated_vm_host` instead of a direct OCID reference.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_instance](#attributes)

### defined_tags<a name='oci_core_instance_defined_tags'>

  Defined tags for this resource. Each key is predefined and scoped to a
namespace. For more information, see [Resource Tags](https://docs.cloud.oracle.com/Content/General/Concepts/resourcetags.htm).

Example: `{"Operations": {"CostCenter": "42"}}`

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_instance](#attributes)

### detached_volumes<a name='oci_core_instance_detached_volumes'>

The volumes your want ensure are detached from  the instance. This is different from the
regular `volumes` property in the sense that this is only about the specified
volumes. It doesn't care about any other volumes attached. It doesn't describe the
the full state, but only the partial state of this volume.

Here is an example on how to use this:

    oci_core_instance { 'tenant (root)/my_instance':
      ensure              => 'present',
        .
        .
      detached_volumes             => {
        'compartment_name/my_volume_1' => {}
      }
    }

The empty hash is required. This is to keep this property the same as all other
volume related properties. Any other information in there will be disregarded



[Back to overview of oci_core_instance](#attributes)

### disable_corrective_change<a name='oci_core_instance_disable_corrective_change'>

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



[Back to overview of oci_core_instance](#attributes)

### disable_corrective_ensure<a name='oci_core_instance_disable_corrective_ensure'>

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



[Back to overview of oci_core_instance](#attributes)

### ensure<a name='oci_core_instance_ensure'>

The basic property that the resource should be in.

Valid values are `present`, `absent`. 

[Back to overview of oci_core_instance](#attributes)

### extended_metadata<a name='oci_core_instance_extended_metadata'>

  Additional metadata key/value pairs that you provide. They serve the same purpose and functionality as fields in the 'metadata' object.

They are distinguished from 'metadata' fields in that these can be nested JSON objects (whereas 'metadata' fields are string/string maps only).

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_instance](#attributes)

### fault_domain<a name='oci_core_instance_fault_domain'>

  A fault domain is a grouping of hardware and infrastructure within an availability domain.
Each availability domain contains three fault domains. Fault domains let you distribute your
instances so that they are not on the same physical hardware within a single availability domain.
A hardware failure or Compute hardware maintenance that affects one fault domain does not affect
instances in other fault domains.

If you do not specify the fault domain, the system selects one for you. To change the fault
domain for an instance, terminate it and launch a new instance in the preferred fault domain.

To get a list of fault domains, use the
{#list_fault_domains list_fault_domains} operation in the
Identity and Access Management Service API.

Example: `FAULT-DOMAIN-1`

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_instance](#attributes)

### freeform_tags<a name='oci_core_instance_freeform_tags'>

  Free-form tags for this resource. Each tag is a simple key-value pair with no
predefined name, type, or namespace. For more information, see [Resource Tags](https://docs.cloud.oracle.com/Content/General/Concepts/resourcetags.htm).

Example: `{"Department": "Finance"}`

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_instance](#attributes)

### id<a name='oci_core_instance_id'>

The OCID of the resource. This is a read-only property.

This documentation is generated from the Ruby OCI SDK.



[Back to overview of oci_core_instance](#attributes)

### instance_name<a name='oci_core_instance_instance_name'>

The name of the instance.



[Back to overview of oci_core_instance](#attributes)

### ipxe_script<a name='oci_core_instance_ipxe_script'>

  This is an advanced option.

When a bare metal or virtual machine
instance boots, the iPXE firmware that runs on the instance is
configured to run an iPXE script to continue the boot process.

If you want more control over the boot process, you can provide
your own custom iPXE script that will run when the instance boots;
however, you should be aware that the same iPXE script will run
every time an instance boots; not only after the initial
LaunchInstance call.

The default iPXE script connects to the instance's local boot
volume over iSCSI and performs a network boot. If you use a custom iPXE
script and want to network-boot from the instance's local boot volume
over iSCSI the same way as the default iPXE script, you should use the
following iSCSI IP address: 169.254.0.2, and boot volume IQN:
iqn.2015-02.oracle.boot.

For more information about the Bring Your Own Image feature of
Oracle Cloud Infrastructure, see
[Bring Your Own Image](https://docs.cloud.oracle.com/Content/Compute/References/bringyourownimage.htm).

For more information about iPXE, see http://ipxe.org.

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_instance](#attributes)

### is_pv_encryption_in_transit_enabled<a name='oci_core_instance_is_pv_encryption_in_transit_enabled'>

Whether to enable in-transit encryption for the data volume's paravirtualized attachment. The default value is false.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_instance](#attributes)

### launch_mode<a name='oci_core_instance_launch_mode'>

  Specifies the configuration mode for launching virtual machine (VM) instances. The configuration modes are:
* `NATIVE` - VM instances launch with iSCSI boot and VFIO devices. The default value for Oracle-provided images.
* `EMULATED` - VM instances launch with emulated devices, such as the E1000 network driver and emulated SCSI disk controller.
* `PARAVIRTUALIZED` - VM instances launch with paravirtualized devices using virtio drivers.
* `CUSTOM` - VM instances launch with custom configuration settings specified in the `LaunchOptions` parameter.

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_instance](#attributes)

### launch_options<a name='oci_core_instance_launch_options'>





[Back to overview of oci_core_instance](#attributes)

### lifecycle_state<a name='oci_core_instance_lifecycle_state'>

The current state of the instance.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_instance](#attributes)

### metadata<a name='oci_core_instance_metadata'>

  Custom metadata key/value pairs that you provide, such as the SSH public key
required to connect to the instance.

A metadata service runs on every launched instance. The service is an HTTP
endpoint listening on 169.254.169.254. You can use the service to:

* Provide information to [Cloud-Init](https://cloudinit.readthedocs.org/en/latest/)
  to be used for various system initialization tasks.

* Get information about the instance, including the custom metadata that you
  provide when you launch the instance.

 **Providing Cloud-Init Metadata**

 You can use the following metadata key names to provide information to
 Cloud-Init:

 **"ssh_authorized_keys"** - Provide one or more public SSH keys to be
 included in the `~/.ssh/authorized_keys` file for the default user on the
 instance. Use a newline character to separate multiple keys. The SSH
 keys must be in the format necessary for the `authorized_keys` file, as shown
 in the example below.

 **"user_data"** - Provide your own base64-encoded data to be used by
 Cloud-Init to run custom scripts or provide custom Cloud-Init configuration. For
 information about how to take advantage of user data, see the
 [Cloud-Init Documentation](http://cloudinit.readthedocs.org/en/latest/topics/format.html).

 **Note:** Cloud-Init does not pull this data from the `http://169.254.169.254/opc/v1/instance/metadata/`
 path. When the instance launches and either of these keys are provided, the key values are formatted as
 OpenStack metadata and copied to the following locations, which are recognized by Cloud-Init:

 `http://169.254.169.254/openstack/latest/meta_data.json` - This JSON blob
 contains, among other things, the SSH keys that you provided for
  **"ssh_authorized_keys"**.

 `http://169.254.169.254/openstack/latest/user_data` - Contains the
 base64-decoded data that you provided for **"user_data"**.

 **Metadata Example**

      "metadata" : {
         "quake_bot_level" : "Severe",
         "ssh_authorized_keys" : "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCZ06fccNTQfq+xubFlJ5ZR3kt+uzspdH9tXL+lAejSM1NXM+CFZev7MIxfEjas06y80ZBZ7DUTQO0GxJPeD8NCOb1VorF8M4xuLwrmzRtkoZzU16umt4y1W0Q4ifdp3IiiU0U8/WxczSXcUVZOLqkz5dc6oMHdMVpkimietWzGZ4LBBsH/LjEVY7E0V+a0sNchlVDIZcm7ErReBLcdTGDq0uLBiuChyl6RUkX1PNhusquTGwK7zc8OBXkRuubn5UKXhI3Ul9Nyk4XESkVWIGNKmw8mSpoJSjR8P9ZjRmcZVo8S+x4KVPMZKQEor== ryan.smith@company.com
         ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAzJSAtwEPoB3Jmr58IXrDGzLuDYkWAYg8AsLYlo6JZvKpjY1xednIcfEVQJm4T2DhVmdWhRrwQ8DmayVZvBkLt+zs2LdoAJEVimKwXcJFD/7wtH8Lnk17HiglbbbNXsemjDY0hea4JUE5CfvkIdZBITuMrfqSmA4n3VNoorXYdvtTMoGG8fxMub46RPtuxtqi9bG9Zqenordkg5FJt2mVNfQRqf83CWojcOkklUWq4CjyxaeLf5i9gv1fRoBo4QhiA8I6NCSppO8GnoV/6Ox6TNoh9BiifqGKC9VGYuC89RvUajRBTZSK2TK4DPfaT+2R+slPsFrwiT/oPEhhEK1S5Q== rsa-key-20160227",
         "user_data" : "SWYgeW91IGNhbiBzZWUgdGhpcywgdGhlbiBpdCB3b3JrZWQgbWF5YmUuCg=="
      }
 **Getting Metadata on the Instance**

 To get information about your instance, connect to the instance using SSH and issue any of the
 following GET requests:

     curl http://169.254.169.254/opc/v1/instance/
     curl http://169.254.169.254/opc/v1/instance/metadata/
     curl http://169.254.169.254/opc/v1/instance/metadata/<any-key-name>

 You'll get back a response that includes all the instance information; only the metadata information; or
 the metadata information for the specified key name, respectively.

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_instance](#attributes)

### name<a name='oci_core_instance_name'>

The full name of the object.



[Back to overview of oci_core_instance](#attributes)

### oci_timeout<a name='oci_core_instance_oci_timeout'>

The maximum time to wait for the OCI resource to be in the ready state.



[Back to overview of oci_core_instance](#attributes)

### oci_wait_interval<a name='oci_core_instance_oci_wait_interval'>

The interval beween calls to OCI to check if a resource is in the ready state.



[Back to overview of oci_core_instance](#attributes)

### present_states<a name='oci_core_instance_present_states'>

The OCI states, puppet will detect as the resource being present.



[Back to overview of oci_core_instance](#attributes)

### provider<a name='oci_core_instance_provider'>

The specific backend to use for this `oci_core_instance`
resource. You will seldom need to specify this --- Puppet will usually
discover the appropriate provider for your platform.Available providers are:

sdk
: This provider uses the [Oracle Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk) to do its work.



[Back to overview of oci_core_instance](#attributes)

### region<a name='oci_core_instance_region'>

  The region that contains the availability domain the instance is running in.

For the us-phoenix-1 and us-ashburn-1 regions, `phx` and `iad` are returned, respectively.
For all other regions, the full region name is returned.

Examples: `phx`, `eu-frankfurt-1`

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_instance](#attributes)

### shape<a name='oci_core_instance_shape'>

  The shape of an instance. The shape determines the number of CPUs, amount of memory,
and other resources allocated to the instance.

You can enumerate all available shapes by calling {#list_shapes list_shapes}.

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_instance](#attributes)

### source_details<a name='oci_core_instance_source_details'>

  Details for creating an instance.
Use this parameter to specify whether a boot volume or an image should be used to launch a new instance.

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_instance](#attributes)

### ssh_authorized_keys<a name='oci_core_instance_ssh_authorized_keys'>

  Provide one or more public SSH keys to be included in the `~/.ssh/authorized_keys` file
  for the default user on the instance. Use a newline character to separate multiple keys.
  The SSH keys must be in the format necessary for the `authorized_keys` file, as shown
  in the example below.

      oci_core_instance { '....':
        ...
        ssh_authorized_keys => "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCZ06fccNTQfq+xubFlJ5ZR3kt+uzspdH9tXL+lAejSM1NXM+CFZev7MIxfEjas06y80ZBZ7DUTQO0GxJPeD8NCOb1VorF8M4xuLwrmzRtkoZzU16umt4y1W0Q4ifdp3IiiU0U8/WxczSXcUVZOLqkz5dc6oMHdMVpkimietWzGZ4LBBsH/LjEVY7E0V+a0sNchlVDIZcm7ErReBLcdTGDq0uLBiuChyl6RUkX1PNhusquTGwK7zc8OBXkRuubn5UKXhI3Ul9Nyk4XESkVWIGNKmw8mSpoJSjR8P9ZjRmcZVo8S+x4KVPMZKQEor== ryan.smith@company.com
ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAzJSAtwEPoB3Jmr58IXrDGzLuDYkWAYg8AsLYlo6JZvKpjY1xednIcfEVQJm4T2DhVmdWhRrwQ8DmayVZvBkLt+zs2LdoAJEVimKwXcJFD/7wtH8Lnk17HiglbbbNXsemjDY0hea4JUE5CfvkIdZBITuMrfqSmA4n3VNoorXYdvtTMoGG8fxMub46RPtuxtqi9bG9Zqenordkg5FJt2mVNfQRqf83CWojcOkklUWq4CjyxaeLf5i9gv1fRoBo4QhiA8I6NCSppO8GnoV/6Ox6TNoh9BiifqGKC9VGYuC89RvUajRBTZSK2TK4DPfaT+2R+slPsFrwiT/oPEhhEK1S5Q== rsa-key-20160227",

        ...
      }

  This property is an helper property and in the end, will fill in the values in the property `metadata`. If you specify
  values in both `metadata` and `ssh_authorized_keys`, you might get unexpected results.



[Back to overview of oci_core_instance](#attributes)

### synchronized<a name='oci_core_instance_synchronized'>

Specifies if Puppet waits for OCI actions to be ready before moving on to an other resource.



[Back to overview of oci_core_instance](#attributes)

### system_tags<a name='oci_core_instance_system_tags'>

  System tags for this resource. Each key is predefined and scoped to a namespace.
Example: `{"foo-namespace": {"bar-key": "value"}}`

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_instance](#attributes)

### tenant<a name='oci_core_instance_tenant'>

The tenant for this resource.



[Back to overview of oci_core_instance](#attributes)

### time_created<a name='oci_core_instance_time_created'>

  The date and time the instance was created, in the format defined by RFC3339.

Example: `2016-08-25T21:10:29.600Z`

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_instance](#attributes)

### time_maintenance_reboot_due<a name='oci_core_instance_time_maintenance_reboot_due'>

  The date and time the instance is expected to be stopped / started,  in the format defined by RFC3339.
After that time if instance hasn't been rebooted, Oracle will reboot the instance within 24 hours of the due time.
Regardless of how the instance was stopped, the flag will be reset to empty as soon as instance reaches Stopped state.
Example: `2018-05-25T21:10:29.600Z`

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_instance](#attributes)

### user_data<a name='oci_core_instance_user_data'>

Provide your own data to be used by Cloud-Init to run custom scripts or provide custom
Cloud-Init configuration. For information about how to take advantage of user data, see the
[Cloud-Init Documentation](http://cloudinit.readthedocs.org/en/latest/topics/format.html).

This property is an helper property and in the end, will fill in the values in the property `metadata`. If you specify
values in both `metadata` and `user_data`, you might get unexpected results.

This propery will take care of the base64 encoding for you. So you can specify a regular value here. Here is
an example on how to use this:

    oci_core_instance { '...':
      ...
      user_data => epp('my_module/startup_script.sh'),
      ...
    }



[Back to overview of oci_core_instance](#attributes)

### vnics<a name='oci_core_instance_vnics'>





[Back to overview of oci_core_instance](#attributes)

### volumes<a name='oci_core_instance_volumes'>

    The volumes connected to the instance. Here is an example on how to use this:

oci_core_instance { 'tenant (root)/my_instance':
  ensure              => 'present',
    .
    .
  volumes             => {
    'compartment_name/my_volume_1' => {
      'attachment_type' => 'paravirtualized',
      'device'          => '/dev/oracleoci/oraclevdb',
      'display_name'    => 'data_disk_1',
      'is_read_only'    => false,
    },
    'compartment_name/my_volume_2' => {
      'attachment_type' => 'paravirtualized',
      'device'          => '/dev/oracleoci/oraclevdc',
      'display_name'    => 'data_disk_2',
      'is_read_only'    => false,
    }
  }
}



[Back to overview of oci_core_instance](#attributes)
