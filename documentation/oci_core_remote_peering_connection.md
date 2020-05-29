---
title: oci core remote peering connection
keywords: documentation
layout: documentation
sidebar: oci_config_sidebar
toc: false
---
## Overview

  A remote peering connection (RPC) is an object on a DRG that lets the VCN that is attached
to the DRG peer with a VCN in a different region. *Peering* means that the two VCNs can
communicate using private IP addresses, but without the traffic traversing the internet or
routing through your on-premises network. For more information, see
[VCN Peering](https://docs.cloud.oracle.com/Content/Network/Tasks/VCNpeering.htm).

To use any of the API operations, you must be authorized in an IAM policy. If you're not authorized,
talk to an administrator. If you're an administrator who needs to write policies to give users access, see
[Getting Started with Policies](https://docs.cloud.oracle.com/Content/Identity/Concepts/policygetstarted.htm).

**Warning:** Oracle recommends that you avoid using any confidential information when you
supply string values using the API.

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).

## Attributes



Attribute Name                                                                                       | Short Description                                                                            |
---------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------- |
[absent_states](#oci_core_remote_peering_connection_absent_states)                                   | The OCI states, puppet will detect as the resource being absent.                             |
[compartment](#oci_core_remote_peering_connection_compartment)                                       | The Puppet name of the resource identified by `compartment_id`.                              |
[compartment_id](#oci_core_remote_peering_connection_compartment_id)                                 | The OCID of the compartment that contains the object.                                        |
[defined_tags](#oci_core_remote_peering_connection_defined_tags)                                     |   Defined tags for this resource.                                                            |
[disable_corrective_change](#oci_core_remote_peering_connection_disable_corrective_change)           | Disable the modification of a resource when Puppet decides it is a corrective change.        |
[disable_corrective_ensure](#oci_core_remote_peering_connection_disable_corrective_ensure)           | Disable the creation or removal of a resource when Puppet decides is a corrective change.    |
[drg](#oci_core_remote_peering_connection_drg)                                                       | The Puppet name of the resource identified by `drg_id`.                                      |
[drg_id](#oci_core_remote_peering_connection_drg_id)                                                 | The OCID of the DRG the RPC belongs to.                                                      |
[ensure](#oci_core_remote_peering_connection_ensure)                                                 | The basic property that the resource should be in.                                           |
[freeform_tags](#oci_core_remote_peering_connection_freeform_tags)                                   |   Free-form tags for this resource.                                                          |
[id](#oci_core_remote_peering_connection_id)                                                         | The OCID of the resource.                                                                    |
[is_cross_tenancy_peering](#oci_core_remote_peering_connection_is_cross_tenancy_peering)             |   Whether the VCN at the other end of the peering is in a different tenancy.                 |
[lifecycle_state](#oci_core_remote_peering_connection_lifecycle_state)                               | The RPC's current lifecycle state.                                                           |
[name](#oci_core_remote_peering_connection_name)                                                     | The full name of the object.                                                                 |
[oci_timeout](#oci_core_remote_peering_connection_oci_timeout)                                       | The maximum time to wait for the OCI resource to be in the ready state.                      |
[oci_wait_interval](#oci_core_remote_peering_connection_oci_wait_interval)                           | The interval beween calls to OCI to check if a resource is in the ready state.               |
[peer](#oci_core_remote_peering_connection_peer)                                                     | The Puppet name of the resource identified by `peer_id`.                                     |
[peer_id](#oci_core_remote_peering_connection_peer_id)                                               | If this RPC is peered, this value is the OCID of the other RPC.                              |
[peer_region_name](#oci_core_remote_peering_connection_peer_region_name)                             |   If this RPC is peered, this value is the region that contains the other RPC.               |
[peer_tenancy](#oci_core_remote_peering_connection_peer_tenancy)                                     | The Puppet name of the resource identified by `peer_tenancy_id`.                             |
[peer_tenancy_id](#oci_core_remote_peering_connection_peer_tenancy_id)                               | If this RPC is peered, this value is the OCID of the other RPC's tenancy.                    |
[peering_status](#oci_core_remote_peering_connection_peering_status)                                 |   Whether the RPC is peered with another RPC.                                                |
[present_states](#oci_core_remote_peering_connection_present_states)                                 | The OCI states, puppet will detect as the resource being present.                            |
[provider](#oci_core_remote_peering_connection_provider)                                             | resource.                                                                                    |
[remote_peering_connection_name](#oci_core_remote_peering_connection_remote_peering_connection_name) | The name of the remote_peering_connection.                                                   |
[synchronized](#oci_core_remote_peering_connection_synchronized)                                     | Specifies if Puppet waits for OCI actions to be ready before moving on to an other resource. |
[tenant](#oci_core_remote_peering_connection_tenant)                                                 | The tenant for this resource.                                                                |
[time_created](#oci_core_remote_peering_connection_time_created)                                     |   The date and time the RPC was created, in the format defined by RFC3339.                   |




### absent_states<a name='oci_core_remote_peering_connection_absent_states'>

The OCI states, puppet will detect as the resource being absent.



[Back to overview of oci_core_remote_peering_connection](#attributes)

### compartment<a name='oci_core_remote_peering_connection_compartment'>

The Puppet name of the resource identified by `compartment_id`.

See the documentation of compartment_id for all details.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_remote_peering_connection](#attributes)

### compartment_id<a name='oci_core_remote_peering_connection_compartment_id'>

The OCID of the compartment that contains the object.

Rather use the property `compartment` instead of a direct OCID reference.

This documentation is generated from the Ruby OCI SDK.



[Back to overview of oci_core_remote_peering_connection](#attributes)

### defined_tags<a name='oci_core_remote_peering_connection_defined_tags'>

  Defined tags for this resource. Each key is predefined and scoped to a
namespace. For more information, see [Resource Tags](https://docs.cloud.oracle.com/Content/General/Concepts/resourcetags.htm).

Example: `{"Operations": {"CostCenter": "42"}}`

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_remote_peering_connection](#attributes)

### disable_corrective_change<a name='oci_core_remote_peering_connection_disable_corrective_change'>

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



[Back to overview of oci_core_remote_peering_connection](#attributes)

### disable_corrective_ensure<a name='oci_core_remote_peering_connection_disable_corrective_ensure'>

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



[Back to overview of oci_core_remote_peering_connection](#attributes)

### drg<a name='oci_core_remote_peering_connection_drg'>

The Puppet name of the resource identified by `drg_id`.

See the documentation of drg_id for all details.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_remote_peering_connection](#attributes)

### drg_id<a name='oci_core_remote_peering_connection_drg_id'>

The OCID of the DRG the RPC belongs to.
Rather use the property `drg` instead of a direct OCID reference.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_remote_peering_connection](#attributes)

### ensure<a name='oci_core_remote_peering_connection_ensure'>

The basic property that the resource should be in.

Valid values are `present`, `absent`. 

[Back to overview of oci_core_remote_peering_connection](#attributes)

### freeform_tags<a name='oci_core_remote_peering_connection_freeform_tags'>

  Free-form tags for this resource. Each tag is a simple key-value pair with no
predefined name, type, or namespace. For more information, see [Resource Tags](https://docs.cloud.oracle.com/Content/General/Concepts/resourcetags.htm).

Example: `{"Department": "Finance"}`

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_remote_peering_connection](#attributes)

### id<a name='oci_core_remote_peering_connection_id'>

The OCID of the resource. This is a read-only property.

This documentation is generated from the Ruby OCI SDK.



[Back to overview of oci_core_remote_peering_connection](#attributes)

### is_cross_tenancy_peering<a name='oci_core_remote_peering_connection_is_cross_tenancy_peering'>

  Whether the VCN at the other end of the peering is in a different tenancy.

Example: `false`

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_remote_peering_connection](#attributes)

### lifecycle_state<a name='oci_core_remote_peering_connection_lifecycle_state'>

The RPC's current lifecycle state.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_remote_peering_connection](#attributes)

### name<a name='oci_core_remote_peering_connection_name'>

The full name of the object.



[Back to overview of oci_core_remote_peering_connection](#attributes)

### oci_timeout<a name='oci_core_remote_peering_connection_oci_timeout'>

The maximum time to wait for the OCI resource to be in the ready state.



[Back to overview of oci_core_remote_peering_connection](#attributes)

### oci_wait_interval<a name='oci_core_remote_peering_connection_oci_wait_interval'>

The interval beween calls to OCI to check if a resource is in the ready state.



[Back to overview of oci_core_remote_peering_connection](#attributes)

### peer<a name='oci_core_remote_peering_connection_peer'>

The Puppet name of the resource identified by `peer_id`.

See the documentation of peer_id for all details.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_remote_peering_connection](#attributes)

### peer_id<a name='oci_core_remote_peering_connection_peer_id'>

If this RPC is peered, this value is the OCID of the other RPC.
Rather use the property `peer` instead of a direct OCID reference.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_remote_peering_connection](#attributes)

### peer_region_name<a name='oci_core_remote_peering_connection_peer_region_name'>

  If this RPC is peered, this value is the region that contains the other RPC.

Example: `us-ashburn-1`

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_remote_peering_connection](#attributes)

### peer_tenancy<a name='oci_core_remote_peering_connection_peer_tenancy'>

The Puppet name of the resource identified by `peer_tenancy_id`.

See the documentation of peer_tenancy_id for all details.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_remote_peering_connection](#attributes)

### peer_tenancy_id<a name='oci_core_remote_peering_connection_peer_tenancy_id'>

If this RPC is peered, this value is the OCID of the other RPC's tenancy.
Rather use the property `peer_tenancy` instead of a direct OCID reference.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_remote_peering_connection](#attributes)

### peering_status<a name='oci_core_remote_peering_connection_peering_status'>

  Whether the RPC is peered with another RPC. `NEW` means the RPC has not yet been
peered. `PENDING` means the peering is being established. `REVOKED` means the
RPC at the other end of the peering has been deleted.

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_remote_peering_connection](#attributes)

### present_states<a name='oci_core_remote_peering_connection_present_states'>

The OCI states, puppet will detect as the resource being present.



[Back to overview of oci_core_remote_peering_connection](#attributes)

### provider<a name='oci_core_remote_peering_connection_provider'>

The specific backend to use for this `oci_core_remote_peering_connection`
resource. You will seldom need to specify this --- Puppet will usually
discover the appropriate provider for your platform.Available providers are:

sdk
: This provider uses the [Oracle Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk) to do its work.



[Back to overview of oci_core_remote_peering_connection](#attributes)

### remote_peering_connection_name<a name='oci_core_remote_peering_connection_remote_peering_connection_name'>

The name of the remote_peering_connection.



[Back to overview of oci_core_remote_peering_connection](#attributes)

### synchronized<a name='oci_core_remote_peering_connection_synchronized'>

Specifies if Puppet waits for OCI actions to be ready before moving on to an other resource.



[Back to overview of oci_core_remote_peering_connection](#attributes)

### tenant<a name='oci_core_remote_peering_connection_tenant'>

The tenant for this resource.



[Back to overview of oci_core_remote_peering_connection](#attributes)

### time_created<a name='oci_core_remote_peering_connection_time_created'>

  The date and time the RPC was created, in the format defined by RFC3339.

Example: `2016-08-25T21:10:29.600Z`

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_remote_peering_connection](#attributes)
