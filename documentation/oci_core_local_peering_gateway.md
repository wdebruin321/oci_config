---
title: oci core local peering gateway
keywords: documentation
layout: documentation
sidebar: oci_config_sidebar
toc: false
---
## Overview

  A local peering gateway (LPG) is an object on a VCN that lets that VCN peer
with another VCN in the same region. *Peering* means that the two VCNs can
communicate using private IP addresses, but without the traffic traversing the
internet or routing through your on-premises network. For more information,
see [VCN Peering](https://docs.cloud.oracle.com/Content/Network/Tasks/VCNpeering.htm).

To use any of the API operations, you must be authorized in an IAM policy. If you're not authorized,
talk to an administrator. If you're an administrator who needs to write policies to give users access, see
[Getting Started with Policies](https://docs.cloud.oracle.com/Content/Identity/Concepts/policygetstarted.htm).

**Warning:** Oracle recommends that you avoid using any confidential information when you
supply string values using the API.

  Here is an example on how to use this:

    oci_core_local_peering_gateway { 'tenant (root)/my_peering_gatewaye':
      ensure      => 'present',
      vcn         => 'my_compartment/my_vcn',
      route_table => 'my_compartment/my_route_table',
    }

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).

## Attributes



Attribute Name                                                                               | Short Description                                                                            |
-------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------- |
[absent_states](#oci_core_local_peering_gateway_absent_states)                               | The OCI states, puppet will detect as the resource being absent.                             |
[compartment](#oci_core_local_peering_gateway_compartment)                                   | The Puppet name of the resource identified by `compartment_id`.                              |
[compartment_id](#oci_core_local_peering_gateway_compartment_id)                             | The OCID of the compartment that contains the object.                                        |
[defined_tags](#oci_core_local_peering_gateway_defined_tags)                                 |   Defined tags for this resource.                                                            |
[disable_corrective_change](#oci_core_local_peering_gateway_disable_corrective_change)       | Disable the modification of a resource when Puppet decides it is a corrective change.        |
[disable_corrective_ensure](#oci_core_local_peering_gateway_disable_corrective_ensure)       | Disable the creation or removal of a resource when Puppet decides is a corrective change.    |
[ensure](#oci_core_local_peering_gateway_ensure)                                             | The basic property that the resource should be in.                                           |
[freeform_tags](#oci_core_local_peering_gateway_freeform_tags)                               |   Free-form tags for this resource.                                                          |
[id](#oci_core_local_peering_gateway_id)                                                     | The OCID of the resource.                                                                    |
[is_cross_tenancy_peering](#oci_core_local_peering_gateway_is_cross_tenancy_peering)         |   Whether the VCN at the other end of the peering is in a different tenancy.                 |
[lifecycle_state](#oci_core_local_peering_gateway_lifecycle_state)                           | The LPG's current lifecycle state.                                                           |
[local_peering_gateway_name](#oci_core_local_peering_gateway_local_peering_gateway_name)     | The name of the local_peering_gateway.                                                       |
[name](#oci_core_local_peering_gateway_name)                                                 | The full name of the object.                                                                 |
[oci_timeout](#oci_core_local_peering_gateway_oci_timeout)                                   | The maximum time to wait for the OCI resource to be in the ready state.                      |
[oci_wait_interval](#oci_core_local_peering_gateway_oci_wait_interval)                       | The interval beween calls to OCI to check if a resource is in the ready state.               |
[peer_advertised_cidr](#oci_core_local_peering_gateway_peer_advertised_cidr)                 | at the other end of the peering from this LPG.                                               |
[peer_advertised_cidr_details](#oci_core_local_peering_gateway_peer_advertised_cidr_details) | end of the peering from this LPG.                                                            |
[peering_status](#oci_core_local_peering_gateway_peering_status)                             |   Whether the LPG is peered with another LPG.                                                |
[peering_status_details](#oci_core_local_peering_gateway_peering_status_details)             | Additional information regarding the peering status, if applicable.                          |
[present_states](#oci_core_local_peering_gateway_present_states)                             | The OCI states, puppet will detect as the resource being present.                            |
[provider](#oci_core_local_peering_gateway_provider)                                         | resource.                                                                                    |
[route_table](#oci_core_local_peering_gateway_route_table)                                   | The Puppet name of the resource identified by `route_table_id`.                              |
[route_table_id](#oci_core_local_peering_gateway_route_table_id)                             |   The OCID of the route table the LPG will use.                                              |
[synchronized](#oci_core_local_peering_gateway_synchronized)                                 | Specifies if Puppet waits for OCI actions to be ready before moving on to an other resource. |
[tenant](#oci_core_local_peering_gateway_tenant)                                             | The tenant for this resource.                                                                |
[time_created](#oci_core_local_peering_gateway_time_created)                                 |   The date and time the LPG was created, in the format defined by RFC3339.                   |
[vcn](#oci_core_local_peering_gateway_vcn)                                                   | The Puppet name of the resource identified by `vcn_id`.                                      |
[vcn_id](#oci_core_local_peering_gateway_vcn_id)                                             | The OCID of the VCN the LPG belongs to.                                                      |




### absent_states<a name='oci_core_local_peering_gateway_absent_states'>

The OCI states, puppet will detect as the resource being absent.



[Back to overview of oci_core_local_peering_gateway](#attributes)

### compartment<a name='oci_core_local_peering_gateway_compartment'>

The Puppet name of the resource identified by `compartment_id`.

See the documentation of compartment_id for all details.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_local_peering_gateway](#attributes)

### compartment_id<a name='oci_core_local_peering_gateway_compartment_id'>

The OCID of the compartment that contains the object.

Rather use the property `compartment` instead of a direct OCID reference.

This documentation is generated from the Ruby OCI SDK.



[Back to overview of oci_core_local_peering_gateway](#attributes)

### defined_tags<a name='oci_core_local_peering_gateway_defined_tags'>

  Defined tags for this resource. Each key is predefined and scoped to a
namespace. For more information, see [Resource Tags](https://docs.cloud.oracle.com/Content/General/Concepts/resourcetags.htm).

Example: `{"Operations": {"CostCenter": "42"}}`

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_local_peering_gateway](#attributes)

### disable_corrective_change<a name='oci_core_local_peering_gateway_disable_corrective_change'>

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



[Back to overview of oci_core_local_peering_gateway](#attributes)

### disable_corrective_ensure<a name='oci_core_local_peering_gateway_disable_corrective_ensure'>

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



[Back to overview of oci_core_local_peering_gateway](#attributes)

### ensure<a name='oci_core_local_peering_gateway_ensure'>

The basic property that the resource should be in.

Valid values are `present`, `absent`. 

[Back to overview of oci_core_local_peering_gateway](#attributes)

### freeform_tags<a name='oci_core_local_peering_gateway_freeform_tags'>

  Free-form tags for this resource. Each tag is a simple key-value pair with no
predefined name, type, or namespace. For more information, see [Resource Tags](https://docs.cloud.oracle.com/Content/General/Concepts/resourcetags.htm).

Example: `{"Department": "Finance"}`

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_local_peering_gateway](#attributes)

### id<a name='oci_core_local_peering_gateway_id'>

The OCID of the resource. This is a read-only property.

This documentation is generated from the Ruby OCI SDK.



[Back to overview of oci_core_local_peering_gateway](#attributes)

### is_cross_tenancy_peering<a name='oci_core_local_peering_gateway_is_cross_tenancy_peering'>

  Whether the VCN at the other end of the peering is in a different tenancy.

Example: `false`

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_local_peering_gateway](#attributes)

### lifecycle_state<a name='oci_core_local_peering_gateway_lifecycle_state'>

The LPG's current lifecycle state.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_local_peering_gateway](#attributes)

### local_peering_gateway_name<a name='oci_core_local_peering_gateway_local_peering_gateway_name'>

The name of the local_peering_gateway.



[Back to overview of oci_core_local_peering_gateway](#attributes)

### name<a name='oci_core_local_peering_gateway_name'>

The full name of the object.



[Back to overview of oci_core_local_peering_gateway](#attributes)

### oci_timeout<a name='oci_core_local_peering_gateway_oci_timeout'>

The maximum time to wait for the OCI resource to be in the ready state.



[Back to overview of oci_core_local_peering_gateway](#attributes)

### oci_wait_interval<a name='oci_core_local_peering_gateway_oci_wait_interval'>

The interval beween calls to OCI to check if a resource is in the ready state.



[Back to overview of oci_core_local_peering_gateway](#attributes)

### peer_advertised_cidr<a name='oci_core_local_peering_gateway_peer_advertised_cidr'>

  The smallest aggregate CIDR that contains all the CIDR routes advertised by the VCN
at the other end of the peering from this LPG. See `peerAdvertisedCidrDetails` for
the individual CIDRs. The value is `null` if the LPG is not peered.

Example: `192.168.0.0/16`, or if aggregated with `172.16.0.0/24` then `128.0.0.0/1`

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_local_peering_gateway](#attributes)

### peer_advertised_cidr_details<a name='oci_core_local_peering_gateway_peer_advertised_cidr_details'>

  The specific ranges of IP addresses available on or via the VCN at the other
end of the peering from this LPG. The value is `null` if the LPG is not peered.
You can use these as destination CIDRs for route rules to route a subnet's
traffic to this LPG.

Example: [`192.168.0.0/16`, `172.16.0.0/24`]

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_local_peering_gateway](#attributes)

### peering_status<a name='oci_core_local_peering_gateway_peering_status'>

  Whether the LPG is peered with another LPG. `NEW` means the LPG has not yet been
peered. `PENDING` means the peering is being established. `REVOKED` means the
LPG at the other end of the peering has been deleted.

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_local_peering_gateway](#attributes)

### peering_status_details<a name='oci_core_local_peering_gateway_peering_status_details'>

Additional information regarding the peering status, if applicable.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_local_peering_gateway](#attributes)

### present_states<a name='oci_core_local_peering_gateway_present_states'>

The OCI states, puppet will detect as the resource being present.



[Back to overview of oci_core_local_peering_gateway](#attributes)

### provider<a name='oci_core_local_peering_gateway_provider'>

The specific backend to use for this `oci_core_local_peering_gateway`
resource. You will seldom need to specify this --- Puppet will usually
discover the appropriate provider for your platform.Available providers are:

sdk
: This provider uses the [Oracle Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk) to do its work.



[Back to overview of oci_core_local_peering_gateway](#attributes)

### route_table<a name='oci_core_local_peering_gateway_route_table'>

The Puppet name of the resource identified by `route_table_id`.

See the documentation of route_table_id for all details.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_local_peering_gateway](#attributes)

### route_table_id<a name='oci_core_local_peering_gateway_route_table_id'>

  The OCID of the route table the LPG will use.

If you don't specify a route table here, the LPG is created without an associated route
table. The Networking service does NOT automatically associate the attached VCN's default route table
with the LPG.

For information about why you would associate a route table with an LPG, see
[Transit Routing: Access to Multiple VCNs in Same Region](https://docs.cloud.oracle.com/Content/Network/Tasks/transitrouting.htm).
  Rather use the property `route_table` instead of a direct OCID reference.

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_local_peering_gateway](#attributes)

### synchronized<a name='oci_core_local_peering_gateway_synchronized'>

Specifies if Puppet waits for OCI actions to be ready before moving on to an other resource.



[Back to overview of oci_core_local_peering_gateway](#attributes)

### tenant<a name='oci_core_local_peering_gateway_tenant'>

The tenant for this resource.



[Back to overview of oci_core_local_peering_gateway](#attributes)

### time_created<a name='oci_core_local_peering_gateway_time_created'>

  The date and time the LPG was created, in the format defined by RFC3339.

Example: `2016-08-25T21:10:29.600Z`

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_local_peering_gateway](#attributes)

### vcn<a name='oci_core_local_peering_gateway_vcn'>

The Puppet name of the resource identified by `vcn_id`.

See the documentation of vcn_id for all details.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_local_peering_gateway](#attributes)

### vcn_id<a name='oci_core_local_peering_gateway_vcn_id'>

The OCID of the VCN the LPG belongs to.
Rather use the property `vcn` instead of a direct OCID reference.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_local_peering_gateway](#attributes)
