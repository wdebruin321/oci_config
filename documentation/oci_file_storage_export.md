---
title: oci file storage export
keywords: documentation
layout: documentation
sidebar: oci_config_sidebar
toc: false
---
## Overview

  A file system and the path that you can use to mount it. Each export
resource belongs to exactly one export set.

The export's path attribute is not a path in the
referenced file system, but the value used by clients for the path
component of the remotetarget argument when mounting the file
system.

The path must start with a slash (/) followed by a sequence of zero or more
slash-separated path elements. For any two export resources associated with
the same export set, except those in a 'DELETED' state, the path element
sequence for the first export resource can't contain the
complete path element sequence of the second export resource.


For example, the following are acceptable:

  * /example and /path
  * /example1 and /example2
  * /example and /example1

The following examples are not acceptable:
  * /example and /example/path
  * / and /example

Paths may not end in a slash (/). No path element can be a period (.)
or two periods in sequence (..). All path elements must be 255 bytes or less.

No two non-'DELETED' export resources in the same export set can
reference the same file system.

Use `exportOptions` to control access to an export. For more information, see
[Export Options](https://docs.cloud.oracle.com/Content/File/Tasks/exportoptions.htm).

**Warning:** Oracle recommends that you avoid using any confidential information when you supply string values using the API.

Here is an example on how to use this:

        oci_file_storage_export { 'tenant (root)/my_compartment:my_export5':
          ensure          => 'present',
          file_system     => 'my_file_system',
          mount_target    => 'my_mount_target',
          export_options  => [
            {
              'source' => '0.0.0.0/0',
              'require_privileged_source_port' => false,
              'access' => 'READ_WRITE',
              'identity_squash' => 'NONE',
              'anonymous_uid' => 65534,
              'anonymous_gid' => 65534
            }],
          }
        }

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).

## Attributes



Attribute Name                                                                  | Short Description                                                                            |
------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------- |
[absent_states](#oci_file_storage_export_absent_states)                         | The OCI states, puppet will detect as the resource being absent.                             |
[compartment](#oci_file_storage_export_compartment)                             | The Puppet name of the resource identified by `compartment_id`.                              |
[compartment_id](#oci_file_storage_export_compartment_id)                       | The OCID of the compartment that contains the object.                                        |
[disable_corrective_change](#oci_file_storage_export_disable_corrective_change) | Disable the modification of a resource when Puppet decides it is a corrective change.        |
[disable_corrective_ensure](#oci_file_storage_export_disable_corrective_ensure) | Disable the creation or removal of a resource when Puppet decides is a corrective change.    |
[ensure](#oci_file_storage_export_ensure)                                       | The basic property that the resource should be in.                                           |
[export_name](#oci_file_storage_export_export_name)                             | The name of the export.                                                                      |
[export_options](#oci_file_storage_export_export_options)                       |   Export options for the new export.                                                         |
[file_system](#oci_file_storage_export_file_system)                             | The Puppet name of the resource identified by `file_system_id`.                              |
[file_system_id](#oci_file_storage_export_file_system_id)                       | The OCID of this export's file system.                                                       |
[id](#oci_file_storage_export_id)                                               | The OCID of the resource.                                                                    |
[lifecycle_state](#oci_file_storage_export_lifecycle_state)                     | The current state of this export.                                                            |
[mount_target](#oci_file_storage_export_mount_target)                           | The Puppet name of the resource identified by `mount_target_id`.                             |
[mount_target_id](#oci_file_storage_export_mount_target_id)                     | The OCID of this export's mount target.                                                      |
[name](#oci_file_storage_export_name)                                           | The full name of the object.                                                                 |
[oci_timeout](#oci_file_storage_export_oci_timeout)                             | The maximum time to wait for the OCI resource to be in the ready state.                      |
[oci_wait_interval](#oci_file_storage_export_oci_wait_interval)                 | The interval beween calls to OCI to check if a resource is in the ready state.               |
[path](#oci_file_storage_export_path)                                           |   Path used to access the associated file system.                                            |
[present_states](#oci_file_storage_export_present_states)                       | The OCI states, puppet will detect as the resource being present.                            |
[provider](#oci_file_storage_export_provider)                                   | resource.                                                                                    |
[synchronized](#oci_file_storage_export_synchronized)                           | Specifies if Puppet waits for OCI actions to be ready before moving on to an other resource. |
[tenant](#oci_file_storage_export_tenant)                                       | The tenant for this resource.                                                                |
[time_created](#oci_file_storage_export_time_created)                           | in [RFC 3339](https://tools.ietf.org/rfc/rfc3339) timestamp format.                          |




### absent_states<a name='oci_file_storage_export_absent_states'>

The OCI states, puppet will detect as the resource being absent.



[Back to overview of oci_file_storage_export](#attributes)

### compartment<a name='oci_file_storage_export_compartment'>

The Puppet name of the resource identified by `compartment_id`.

See the documentation of compartment_id for all details.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_file_storage_export](#attributes)

### compartment_id<a name='oci_file_storage_export_compartment_id'>

The OCID of the compartment that contains the object.

Rather use the property `compartment` instead of a direct OCID reference.

This documentation is generated from the Ruby OCI SDK.



[Back to overview of oci_file_storage_export](#attributes)

### disable_corrective_change<a name='oci_file_storage_export_disable_corrective_change'>

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



[Back to overview of oci_file_storage_export](#attributes)

### disable_corrective_ensure<a name='oci_file_storage_export_disable_corrective_ensure'>

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



[Back to overview of oci_file_storage_export](#attributes)

### ensure<a name='oci_file_storage_export_ensure'>

The basic property that the resource should be in.

Valid values are `present`, `absent`. 

[Back to overview of oci_file_storage_export](#attributes)

### export_name<a name='oci_file_storage_export_export_name'>

The name of the export.



[Back to overview of oci_file_storage_export](#attributes)

### export_options<a name='oci_file_storage_export_export_options'>

  Export options for the new export. If left unspecified,
defaults to:

       [
         {
            "source" : "0.0.0.0/0",
            "requirePrivilegedSourcePort" : false,
            "access" : "READ_WRITE",
            "identitySquash" : "NONE"
          }
       ]

  **Note:** Mount targets do not have Internet-routable IP
  addresses.  Therefore they will not be reachable from the
  Internet, even if an associated `ClientOptions` item has
  a source of `0.0.0.0/0`.

  **If set to the empty array then the export will not be
  visible to any clients.**

  The export's `exportOptions` can be changed after creation
  using the `UpdateExport` operation.

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_file_storage_export](#attributes)

### file_system<a name='oci_file_storage_export_file_system'>

The Puppet name of the resource identified by `file_system_id`.

See the documentation of file_system_id for all details.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_file_storage_export](#attributes)

### file_system_id<a name='oci_file_storage_export_file_system_id'>

The OCID of this export's file system.
Rather use the property `file_system` instead of a direct OCID reference.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_file_storage_export](#attributes)

### id<a name='oci_file_storage_export_id'>

The OCID of the resource. This is a read-only property.

This documentation is generated from the Ruby OCI SDK.



[Back to overview of oci_file_storage_export](#attributes)

### lifecycle_state<a name='oci_file_storage_export_lifecycle_state'>

The current state of this export.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_file_storage_export](#attributes)

### mount_target<a name='oci_file_storage_export_mount_target'>

The Puppet name of the resource identified by `mount_target_id`.

See the documentation of file_system_id for all details.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_file_storage_export](#attributes)

### mount_target_id<a name='oci_file_storage_export_mount_target_id'>

The OCID of this export's mount target.
Rather use the property `mount_target` instead of a direct OCID reference.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_file_storage_export](#attributes)

### name<a name='oci_file_storage_export_name'>

The full name of the object.



[Back to overview of oci_file_storage_export](#attributes)

### oci_timeout<a name='oci_file_storage_export_oci_timeout'>

The maximum time to wait for the OCI resource to be in the ready state.



[Back to overview of oci_file_storage_export](#attributes)

### oci_wait_interval<a name='oci_file_storage_export_oci_wait_interval'>

The interval beween calls to OCI to check if a resource is in the ready state.



[Back to overview of oci_file_storage_export](#attributes)

### path<a name='oci_file_storage_export_path'>

  Path used to access the associated file system.

Avoid entering confidential information.

Example: `/mediafiles`

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_file_storage_export](#attributes)

### present_states<a name='oci_file_storage_export_present_states'>

The OCI states, puppet will detect as the resource being present.



[Back to overview of oci_file_storage_export](#attributes)

### provider<a name='oci_file_storage_export_provider'>

The specific backend to use for this `oci_file_storage_export`
resource. You will seldom need to specify this --- Puppet will usually
discover the appropriate provider for your platform.Available providers are:

sdk
: This provider uses the [Oracle Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk) to do its work.



[Back to overview of oci_file_storage_export](#attributes)

### synchronized<a name='oci_file_storage_export_synchronized'>

Specifies if Puppet waits for OCI actions to be ready before moving on to an other resource.



[Back to overview of oci_file_storage_export](#attributes)

### tenant<a name='oci_file_storage_export_tenant'>

The tenant for this resource.



[Back to overview of oci_file_storage_export](#attributes)

### time_created<a name='oci_file_storage_export_time_created'>

  The date and time the export was created, expressed
in [RFC 3339](https://tools.ietf.org/rfc/rfc3339) timestamp format.

Example: `2016-08-25T21:10:29.600Z`

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_file_storage_export](#attributes)
