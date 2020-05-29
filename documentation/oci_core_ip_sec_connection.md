---
title: oci core ip sec connection
keywords: documentation
layout: documentation
sidebar: oci_config_sidebar
toc: false
---
## Overview

  A connection between a DRG and CPE. This connection consists of multiple IPSec
tunnels. Creating this connection is one of the steps required when setting up
an IPSec VPN.

**Important:**  Each tunnel in an IPSec connection can use either static routing or BGP dynamic
routing (see the {IPSecConnectionTunnel} object's
`routing` attribute). Originally only static routing was supported and
every IPSec connection was required to have at least one static route configured.
To maintain backward compatibility in the API when support for BPG dynamic routing was introduced,
the API accepts an empty list of static routes if you configure both of the IPSec tunnels to use
BGP dynamic routing. If you switch a tunnel's routing from `BGP` to `STATIC`, you must first
ensure that the IPSec connection is configured with at least one valid CIDR block static route.
Oracle uses the IPSec connection's static routes when routing a tunnel's traffic *only*
if that tunnel's `routing` attribute = `STATIC`. Otherwise the static routes are ignored.

For more information about the workflow for setting up an IPSec connection, see
[IPSec VPN](https://docs.cloud.oracle.com/Content/Network/Tasks/managingIPsec.htm).

To use any of the API operations, you must be authorized in an IAM policy. If you're not authorized,
talk to an administrator. If you're an administrator who needs to write policies to give users access, see
[Getting Started with Policies](https://docs.cloud.oracle.com/Content/Identity/Concepts/policygetstarted.htm).

**Warning:** Oracle recommends that you avoid using any confidential information when you
supply string values using the API.

  Here is an example on how to use this:

    oci_core_ip_sec_connection { 'tenant (root)/my_ip_sec_connection':
      ensure        => 'present',
      drg           => 'my_compartment/my_drg',
      cpe           => 'my_compartment/my_cpe',
      static_routes => ['10.0.0.0/16'],
      oci_timeout   => 1200, # This can take a long time, so we need a longer timeout
    }

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).

## Attributes



Attribute Name                                                                     | Short Description                                                                            |
---------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------- |
[absent_states](#oci_core_ip_sec_connection_absent_states)                         | The OCI states, puppet will detect as the resource being absent.                             |
[compartment](#oci_core_ip_sec_connection_compartment)                             | The Puppet name of the resource identified by `compartment_id`.                              |
[compartment_id](#oci_core_ip_sec_connection_compartment_id)                       | The OCID of the compartment that contains the object.                                        |
[cpe](#oci_core_ip_sec_connection_cpe)                                             | The Puppet name of the resource identified by `cpe_id`.                                      |
[cpe_id](#oci_core_ip_sec_connection_cpe_id)                                       | The OCID of the {Cpe} object.                                                                |
[cpe_local_identifier](#oci_core_ip_sec_connection_cpe_local_identifier)           |   Your identifier for your CPE device.                                                       |
[cpe_local_identifier_type](#oci_core_ip_sec_connection_cpe_local_identifier_type) |   The type of identifier for your CPE device.                                                |
[defined_tags](#oci_core_ip_sec_connection_defined_tags)                           |   Defined tags for this resource.                                                            |
[disable_corrective_change](#oci_core_ip_sec_connection_disable_corrective_change) | Disable the modification of a resource when Puppet decides it is a corrective change.        |
[disable_corrective_ensure](#oci_core_ip_sec_connection_disable_corrective_ensure) | Disable the creation or removal of a resource when Puppet decides is a corrective change.    |
[drg](#oci_core_ip_sec_connection_drg)                                             | The Puppet name of the resource identified by `drg_id`.                                      |
[drg_id](#oci_core_ip_sec_connection_drg_id)                                       | The OCID of the DRG.                                                                         |
[ensure](#oci_core_ip_sec_connection_ensure)                                       | The basic property that the resource should be in.                                           |
[freeform_tags](#oci_core_ip_sec_connection_freeform_tags)                         |   Free-form tags for this resource.                                                          |
[id](#oci_core_ip_sec_connection_id)                                               | The OCID of the resource.                                                                    |
[ip_sec_connection_name](#oci_core_ip_sec_connection_ip_sec_connection_name)       | The name of the ip_sec_connection.                                                           |
[lifecycle_state](#oci_core_ip_sec_connection_lifecycle_state)                     | The IPSec connection's current state.                                                        |
[name](#oci_core_ip_sec_connection_name)                                           | The full name of the object.                                                                 |
[oci_timeout](#oci_core_ip_sec_connection_oci_timeout)                             | The maximum time to wait for the OCI resource to be in the ready state.                      |
[oci_wait_interval](#oci_core_ip_sec_connection_oci_wait_interval)                 | The interval beween calls to OCI to check if a resource is in the ready state.               |
[present_states](#oci_core_ip_sec_connection_present_states)                       | The OCI states, puppet will detect as the resource being present.                            |
[provider](#oci_core_ip_sec_connection_provider)                                   | resource.                                                                                    |
[static_routes](#oci_core_ip_sec_connection_static_routes)                         |   Static routes to the CPE.                                                                  |
[synchronized](#oci_core_ip_sec_connection_synchronized)                           | Specifies if Puppet waits for OCI actions to be ready before moving on to an other resource. |
[tenant](#oci_core_ip_sec_connection_tenant)                                       | The tenant for this resource.                                                                |
[time_created](#oci_core_ip_sec_connection_time_created)                           |   The date and time the IPSec connection was created, in the format defined by RFC3339.      |
[tunnel_configuration](#oci_core_ip_sec_connection_tunnel_configuration)           |   Information for creating the individual tunnels in the IPSec connection.                   |




### absent_states<a name='oci_core_ip_sec_connection_absent_states'>

The OCI states, puppet will detect as the resource being absent.



[Back to overview of oci_core_ip_sec_connection](#attributes)

### compartment<a name='oci_core_ip_sec_connection_compartment'>

The Puppet name of the resource identified by `compartment_id`.

See the documentation of compartment_id for all details.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_ip_sec_connection](#attributes)

### compartment_id<a name='oci_core_ip_sec_connection_compartment_id'>

The OCID of the compartment that contains the object.

Rather use the property `compartment` instead of a direct OCID reference.

This documentation is generated from the Ruby OCI SDK.



[Back to overview of oci_core_ip_sec_connection](#attributes)

### cpe<a name='oci_core_ip_sec_connection_cpe'>

The Puppet name of the resource identified by `cpe_id`.

See the documentation of cpe_id for all details.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_ip_sec_connection](#attributes)

### cpe_id<a name='oci_core_ip_sec_connection_cpe_id'>

The OCID of the {Cpe} object.
Rather use the property `cpe` instead of a direct OCID reference.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_ip_sec_connection](#attributes)

### cpe_local_identifier<a name='oci_core_ip_sec_connection_cpe_local_identifier'>

  Your identifier for your CPE device. Can be either an IP address or a hostname (specifically, the
fully qualified domain name (FQDN)). The type of identifier you provide here must correspond
to the value for `cpeLocalIdentifierType`.

If you don't provide a value, the `ipAddress` attribute for the {Cpe}
object specified by `cpeId` is used as the `cpeLocalIdentifier`.

For information about why you'd provide this value, see
[If Your CPE Is Behind a NAT Device](https://docs.cloud.oracle.com/Content/Network/Tasks/overviewIPsec.htm#nat).

Example IP address: `10.0.3.3`

Example hostname: `cpe.example.com`

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_ip_sec_connection](#attributes)

### cpe_local_identifier_type<a name='oci_core_ip_sec_connection_cpe_local_identifier_type'>

  The type of identifier for your CPE device. The value you provide here must correspond to the value
for `cpeLocalIdentifier`.

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_ip_sec_connection](#attributes)

### defined_tags<a name='oci_core_ip_sec_connection_defined_tags'>

  Defined tags for this resource. Each key is predefined and scoped to a
namespace. For more information, see [Resource Tags](https://docs.cloud.oracle.com/Content/General/Concepts/resourcetags.htm).

Example: `{"Operations": {"CostCenter": "42"}}`

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_ip_sec_connection](#attributes)

### disable_corrective_change<a name='oci_core_ip_sec_connection_disable_corrective_change'>

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



[Back to overview of oci_core_ip_sec_connection](#attributes)

### disable_corrective_ensure<a name='oci_core_ip_sec_connection_disable_corrective_ensure'>

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



[Back to overview of oci_core_ip_sec_connection](#attributes)

### drg<a name='oci_core_ip_sec_connection_drg'>

The Puppet name of the resource identified by `drg_id`.

See the documentation of drg_id for all details.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_ip_sec_connection](#attributes)

### drg_id<a name='oci_core_ip_sec_connection_drg_id'>

The OCID of the DRG.
Rather use the property `drg` instead of a direct OCID reference.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_ip_sec_connection](#attributes)

### ensure<a name='oci_core_ip_sec_connection_ensure'>

The basic property that the resource should be in.

Valid values are `present`, `absent`. 

[Back to overview of oci_core_ip_sec_connection](#attributes)

### freeform_tags<a name='oci_core_ip_sec_connection_freeform_tags'>

  Free-form tags for this resource. Each tag is a simple key-value pair with no
predefined name, type, or namespace. For more information, see [Resource Tags](https://docs.cloud.oracle.com/Content/General/Concepts/resourcetags.htm).

Example: `{"Department": "Finance"}`

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_ip_sec_connection](#attributes)

### id<a name='oci_core_ip_sec_connection_id'>

The OCID of the resource. This is a read-only property.

This documentation is generated from the Ruby OCI SDK.



[Back to overview of oci_core_ip_sec_connection](#attributes)

### ip_sec_connection_name<a name='oci_core_ip_sec_connection_ip_sec_connection_name'>

The name of the ip_sec_connection.



[Back to overview of oci_core_ip_sec_connection](#attributes)

### lifecycle_state<a name='oci_core_ip_sec_connection_lifecycle_state'>

The IPSec connection's current state.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_ip_sec_connection](#attributes)

### name<a name='oci_core_ip_sec_connection_name'>

The full name of the object.



[Back to overview of oci_core_ip_sec_connection](#attributes)

### oci_timeout<a name='oci_core_ip_sec_connection_oci_timeout'>

The maximum time to wait for the OCI resource to be in the ready state.



[Back to overview of oci_core_ip_sec_connection](#attributes)

### oci_wait_interval<a name='oci_core_ip_sec_connection_oci_wait_interval'>

The interval beween calls to OCI to check if a resource is in the ready state.



[Back to overview of oci_core_ip_sec_connection](#attributes)

### present_states<a name='oci_core_ip_sec_connection_present_states'>

The OCI states, puppet will detect as the resource being present.



[Back to overview of oci_core_ip_sec_connection](#attributes)

### provider<a name='oci_core_ip_sec_connection_provider'>

The specific backend to use for this `oci_core_ip_sec_connection`
resource. You will seldom need to specify this --- Puppet will usually
discover the appropriate provider for your platform.Available providers are:

sdk
: This provider uses the [Oracle Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk) to do its work.



[Back to overview of oci_core_ip_sec_connection](#attributes)

### static_routes<a name='oci_core_ip_sec_connection_static_routes'>

  Static routes to the CPE. A static route's CIDR must not be a
multicast address or class E address.

Used for routing a given IPSec tunnel's traffic only if the tunnel
is using static routing. If you configure at least one tunnel to use static routing, then
you must provide at least one valid static route. If you configure both
tunnels to use BGP dynamic routing, you can provide an empty list for the static routes.
For more information, see the important note in {IPSecConnection}.

The CIDR can be either IPv4 or IPv6. Note that IPv6 addressing is currently supported only
in certain regions. See [IPv6 Addresses](https://docs.cloud.oracle.com/Content/Network/Concepts/ipv6.htm).

Example: `10.0.1.0/24`

Example: `2001:db8::/32`

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_ip_sec_connection](#attributes)

### synchronized<a name='oci_core_ip_sec_connection_synchronized'>

Specifies if Puppet waits for OCI actions to be ready before moving on to an other resource.



[Back to overview of oci_core_ip_sec_connection](#attributes)

### tenant<a name='oci_core_ip_sec_connection_tenant'>

The tenant for this resource.



[Back to overview of oci_core_ip_sec_connection](#attributes)

### time_created<a name='oci_core_ip_sec_connection_time_created'>

  The date and time the IPSec connection was created, in the format defined by RFC3339.

Example: `2016-08-25T21:10:29.600Z`

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_ip_sec_connection](#attributes)

### tunnel_configuration<a name='oci_core_ip_sec_connection_tunnel_configuration'>

  Information for creating the individual tunnels in the IPSec connection. You can provide a
maximum of 2 `tunnelConfiguration` objects in the array (one for each of the
two tunnels).

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_ip_sec_connection](#attributes)
