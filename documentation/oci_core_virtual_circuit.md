---
title: oci core virtual circuit
keywords: documentation
layout: documentation
sidebar: oci_config_sidebar
toc: false
---
## Overview

  For use with Oracle Cloud Infrastructure FastConnect.

A virtual circuit is an isolated network path that runs over one or more physical
network connections to provide a single, logical connection between the edge router
on the customer's existing network and Oracle Cloud Infrastructure. *Private*
virtual circuits support private peering, and *public* virtual circuits support
public peering. For more information, see [FastConnect Overview](https://docs.cloud.oracle.com/Content/Network/Concepts/fastconnect.htm).

Each virtual circuit is made up of information shared between a customer, Oracle,
and a provider (if the customer is using FastConnect via a provider). Who fills in
a given property of a virtual circuit depends on whether the BGP session related to
that virtual circuit goes from the customer's edge router to Oracle, or from the provider's
edge router to Oracle. Also, in the case where the customer is using a provider, values
for some of the properties may not be present immediately, but may get filled in as the
provider and Oracle each do their part to provision the virtual circuit.

To use any of the API operations, you must be authorized in an IAM policy. If you're not authorized,
talk to an administrator. If you're an administrator who needs to write policies to give users access, see
[Getting Started with Policies](https://docs.cloud.oracle.com/Content/Identity/Concepts/policygetstarted.htm).

**Warning:** Oracle recommends that you avoid using any confidential information when you
supply string values using the API.

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).

## Attributes



Attribute Name                                                                   | Short Description                                                                            |
-------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------- |
[absent_states](#oci_core_virtual_circuit_absent_states)                         | The OCI states, puppet will detect as the resource being absent.                             |
[bandwidth_shape_name](#oci_core_virtual_circuit_bandwidth_shape_name)           |   The provisioned data rate of the connection.                                               |
[bgp_session_state](#oci_core_virtual_circuit_bgp_session_state)                 | The state of the BGP session associated with the virtual circuit.                            |
[compartment](#oci_core_virtual_circuit_compartment)                             | The Puppet name of the resource identified by `compartment_id`.                              |
[compartment_id](#oci_core_virtual_circuit_compartment_id)                       | The OCID of the compartment that contains the object.                                        |
[cross_connect_mappings](#oci_core_virtual_circuit_cross_connect_mappings)       | group this virtual circuit will run on.                                                      |
[customer_asn](#oci_core_virtual_circuit_customer_asn)                           |   Your BGP ASN (either public or private).                                                   |
[customer_bgp_asn](#oci_core_virtual_circuit_customer_bgp_asn)                   |   Deprecated.                                                                                |
[defined_tags](#oci_core_virtual_circuit_defined_tags)                           |   Defined tags for this resource.                                                            |
[disable_corrective_change](#oci_core_virtual_circuit_disable_corrective_change) | Disable the modification of a resource when Puppet decides it is a corrective change.        |
[disable_corrective_ensure](#oci_core_virtual_circuit_disable_corrective_ensure) | Disable the creation or removal of a resource when Puppet decides is a corrective change.    |
[ensure](#oci_core_virtual_circuit_ensure)                                       | The basic property that the resource should be in.                                           |
[freeform_tags](#oci_core_virtual_circuit_freeform_tags)                         |   Free-form tags for this resource.                                                          |
[gateway](#oci_core_virtual_circuit_gateway)                                     | The Puppet name of the resource identified by `gateway_id`.                                  |
[gateway_id](#oci_core_virtual_circuit_gateway_id)                               |   For private virtual circuits only.                                                         |
[id](#oci_core_virtual_circuit_id)                                               | The OCID of the resource.                                                                    |
[lifecycle_state](#oci_core_virtual_circuit_lifecycle_state)                     |   The virtual circuit's current state.                                                       |
[name](#oci_core_virtual_circuit_name)                                           | The full name of the object.                                                                 |
[oci_timeout](#oci_core_virtual_circuit_oci_timeout)                             | The maximum time to wait for the OCI resource to be in the ready state.                      |
[oci_wait_interval](#oci_core_virtual_circuit_oci_wait_interval)                 | The interval beween calls to OCI to check if a resource is in the ready state.               |
[oracle_bgp_asn](#oci_core_virtual_circuit_oracle_bgp_asn)                       | The Oracle BGP ASN.                                                                          |
[present_states](#oci_core_virtual_circuit_present_states)                       | The OCI states, puppet will detect as the resource being present.                            |
[provider](#oci_core_virtual_circuit_provider)                                   | resource.                                                                                    |
[provider_service](#oci_core_virtual_circuit_provider_service)                   | The Puppet name of the resource identified by `provider_service_id`.                         |
[provider_service_id](#oci_core_virtual_circuit_provider_service_id)             | via a provider).                                                                             |
[provider_service_key_name](#oci_core_virtual_circuit_provider_service_key_name) | The service key name offered by the provider (if the customer is connecting via a provider). |
[provider_state](#oci_core_virtual_circuit_provider_state)                       | customer is connecting via a provider).                                                      |
[public_prefixes](#oci_core_virtual_circuit_public_prefixes)                     |   For a public virtual circuit.                                                              |
[reference_comment](#oci_core_virtual_circuit_reference_comment)                 | (if the customer is connecting via a provider).                                              |
[region](#oci_core_virtual_circuit_region)                                       | circuit is located.                                                                          |
[service_type](#oci_core_virtual_circuit_service_type)                           | Provider service type.                                                                       |
[synchronized](#oci_core_virtual_circuit_synchronized)                           | Specifies if Puppet waits for OCI actions to be ready before moving on to an other resource. |
[tenant](#oci_core_virtual_circuit_tenant)                                       | The tenant for this resource.                                                                |
[time_created](#oci_core_virtual_circuit_time_created)                           | in the format defined by RFC3339.                                                            |
[type](#oci_core_virtual_circuit_type)                                           |   The type of IP addresses used in this virtual circuit.                                     |
[virtual_circuit_name](#oci_core_virtual_circuit_virtual_circuit_name)           | The name of the virtual_circuit.                                                             |




### absent_states<a name='oci_core_virtual_circuit_absent_states'>

The OCI states, puppet will detect as the resource being absent.



[Back to overview of oci_core_virtual_circuit](#attributes)

### bandwidth_shape_name<a name='oci_core_virtual_circuit_bandwidth_shape_name'>

  The provisioned data rate of the connection.  To get a list of the
available bandwidth levels (that is, shapes), see
{#list_fast_connect_provider_virtual_circuit_bandwidth_shapes list_fast_connect_provider_virtual_circuit_bandwidth_shapes}.

Example: `10 Gbps`

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_virtual_circuit](#attributes)

### bgp_session_state<a name='oci_core_virtual_circuit_bgp_session_state'>

The state of the BGP session associated with the virtual circuit.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_virtual_circuit](#attributes)

### compartment<a name='oci_core_virtual_circuit_compartment'>

The Puppet name of the resource identified by `compartment_id`.

See the documentation of compartment_id for all details.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_virtual_circuit](#attributes)

### compartment_id<a name='oci_core_virtual_circuit_compartment_id'>

The OCID of the compartment that contains the object.

Rather use the property `compartment` instead of a direct OCID reference.

This documentation is generated from the Ruby OCI SDK.



[Back to overview of oci_core_virtual_circuit](#attributes)

### cross_connect_mappings<a name='oci_core_virtual_circuit_cross_connect_mappings'>

  Create a `CrossConnectMapping` for each cross-connect or cross-connect
group this virtual circuit will run on.

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_virtual_circuit](#attributes)

### customer_asn<a name='oci_core_virtual_circuit_customer_asn'>

  Your BGP ASN (either public or private). Provide this value only if
there's a BGP session that goes from your edge router to Oracle.
Otherwise, leave this empty or null.
Can be a 2-byte or 4-byte ASN. Uses "asplain" format.

Example: `12345` (2-byte) or `1587232876` (4-byte)

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_virtual_circuit](#attributes)

### customer_bgp_asn<a name='oci_core_virtual_circuit_customer_bgp_asn'>

  Deprecated. Instead use `customerAsn`.
If you specify values for both, the request will be rejected.

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_virtual_circuit](#attributes)

### defined_tags<a name='oci_core_virtual_circuit_defined_tags'>

  Defined tags for this resource. Each key is predefined and scoped to a
namespace. For more information, see [Resource Tags](https://docs.cloud.oracle.com/Content/General/Concepts/resourcetags.htm).

Example: `{"Operations": {"CostCenter": "42"}}`

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_virtual_circuit](#attributes)

### disable_corrective_change<a name='oci_core_virtual_circuit_disable_corrective_change'>

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



[Back to overview of oci_core_virtual_circuit](#attributes)

### disable_corrective_ensure<a name='oci_core_virtual_circuit_disable_corrective_ensure'>

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



[Back to overview of oci_core_virtual_circuit](#attributes)

### ensure<a name='oci_core_virtual_circuit_ensure'>

The basic property that the resource should be in.

Valid values are `present`, `absent`. 

[Back to overview of oci_core_virtual_circuit](#attributes)

### freeform_tags<a name='oci_core_virtual_circuit_freeform_tags'>

  Free-form tags for this resource. Each tag is a simple key-value pair with no
predefined name, type, or namespace. For more information, see [Resource Tags](https://docs.cloud.oracle.com/Content/General/Concepts/resourcetags.htm).

Example: `{"Department": "Finance"}`

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_virtual_circuit](#attributes)

### gateway<a name='oci_core_virtual_circuit_gateway'>

The Puppet name of the resource identified by `gateway_id`.

See the documentation of gateway_id for all details.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_virtual_circuit](#attributes)

### gateway_id<a name='oci_core_virtual_circuit_gateway_id'>

  For private virtual circuits only. The OCID of the {Drg}
that this virtual circuit uses.
  Rather use the property `gateway` instead of a direct OCID reference.

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_virtual_circuit](#attributes)

### id<a name='oci_core_virtual_circuit_id'>

The OCID of the resource. This is a read-only property.

This documentation is generated from the Ruby OCI SDK.



[Back to overview of oci_core_virtual_circuit](#attributes)

### lifecycle_state<a name='oci_core_virtual_circuit_lifecycle_state'>

  The virtual circuit's current state. For information about
the different states, see
[FastConnect Overview](https://docs.cloud.oracle.com/Content/Network/Concepts/fastconnect.htm).

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_virtual_circuit](#attributes)

### name<a name='oci_core_virtual_circuit_name'>

The full name of the object.



[Back to overview of oci_core_virtual_circuit](#attributes)

### oci_timeout<a name='oci_core_virtual_circuit_oci_timeout'>

The maximum time to wait for the OCI resource to be in the ready state.



[Back to overview of oci_core_virtual_circuit](#attributes)

### oci_wait_interval<a name='oci_core_virtual_circuit_oci_wait_interval'>

The interval beween calls to OCI to check if a resource is in the ready state.



[Back to overview of oci_core_virtual_circuit](#attributes)

### oracle_bgp_asn<a name='oci_core_virtual_circuit_oracle_bgp_asn'>

The Oracle BGP ASN.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_virtual_circuit](#attributes)

### present_states<a name='oci_core_virtual_circuit_present_states'>

The OCI states, puppet will detect as the resource being present.



[Back to overview of oci_core_virtual_circuit](#attributes)

### provider<a name='oci_core_virtual_circuit_provider'>

The specific backend to use for this `oci_core_virtual_circuit`
resource. You will seldom need to specify this --- Puppet will usually
discover the appropriate provider for your platform.Available providers are:

sdk
: This provider uses the [Oracle Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk) to do its work.



[Back to overview of oci_core_virtual_circuit](#attributes)

### provider_service<a name='oci_core_virtual_circuit_provider_service'>

The Puppet name of the resource identified by `provider_service_id`.

See the documentation of provider_service_id for all details.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_virtual_circuit](#attributes)

### provider_service_id<a name='oci_core_virtual_circuit_provider_service_id'>

  The OCID of the service offered by the provider (if you're connecting
via a provider). To get a list of the available service offerings, see
{#list_fast_connect_provider_services list_fast_connect_provider_services}.
  Rather use the property `provider_service` instead of a direct OCID reference.

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_virtual_circuit](#attributes)

### provider_service_key_name<a name='oci_core_virtual_circuit_provider_service_key_name'>

The service key name offered by the provider (if the customer is connecting via a provider).

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_virtual_circuit](#attributes)

### provider_state<a name='oci_core_virtual_circuit_provider_state'>

  The provider's state in relation to this virtual circuit (if the
customer is connecting via a provider). ACTIVE means
the provider has provisioned the virtual circuit from their end.
INACTIVE means the provider has not yet provisioned the virtual
circuit, or has de-provisioned it.

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_virtual_circuit](#attributes)

### public_prefixes<a name='oci_core_virtual_circuit_public_prefixes'>

  For a public virtual circuit. The public IP prefixes (CIDRs) the customer wants to
advertise across the connection.

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_virtual_circuit](#attributes)

### reference_comment<a name='oci_core_virtual_circuit_reference_comment'>

  Provider-supplied reference information about this virtual circuit
(if the customer is connecting via a provider).

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_virtual_circuit](#attributes)

### region<a name='oci_core_virtual_circuit_region'>

  The Oracle Cloud Infrastructure region where this virtual
circuit is located.
Example: `phx`

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_virtual_circuit](#attributes)

### service_type<a name='oci_core_virtual_circuit_service_type'>

Provider service type.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_virtual_circuit](#attributes)

### synchronized<a name='oci_core_virtual_circuit_synchronized'>

Specifies if Puppet waits for OCI actions to be ready before moving on to an other resource.



[Back to overview of oci_core_virtual_circuit](#attributes)

### tenant<a name='oci_core_virtual_circuit_tenant'>

The tenant for this resource.



[Back to overview of oci_core_virtual_circuit](#attributes)

### time_created<a name='oci_core_virtual_circuit_time_created'>

  The date and time the virtual circuit was created,
in the format defined by RFC3339.

Example: `2016-08-25T21:10:29.600Z`

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_virtual_circuit](#attributes)

### type<a name='oci_core_virtual_circuit_type'>

  The type of IP addresses used in this virtual circuit. PRIVATE
means [RFC 1918](https://tools.ietf.org/html/rfc1918) addresses
(10.0.0.0/8, 172.16/12, and 192.168/16).

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_virtual_circuit](#attributes)

### virtual_circuit_name<a name='oci_core_virtual_circuit_virtual_circuit_name'>

The name of the virtual_circuit.



[Back to overview of oci_core_virtual_circuit](#attributes)
