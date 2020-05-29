---
title: oci core security list
keywords: documentation
layout: documentation
sidebar: oci_config_sidebar
toc: false
---
## Overview

  A set of virtual firewall rules for your VCN. Security lists are configured at the subnet
level, but the rules are applied to the ingress and egress traffic for the individual instances
in the subnet. The rules can be stateful or stateless. For more information, see
[Security Lists](https://docs.cloud.oracle.com/Content/Network/Concepts/securitylists.htm).
**Note:** Compare security lists to {NetworkSecurityGroup}s,
which let you apply a set of security rules to a *specific set of VNICs* instead of an entire
subnet. Oracle recommends using network security groups instead of security lists, although you
can use either or both together.

**Important:** Oracle Cloud Infrastructure Compute service images automatically include firewall rules (for example,
Linux iptables, Windows firewall). If there are issues with some type of access to an instance,
make sure both the security lists associated with the instance's subnet and the instance's
firewall rules are set correctly.

To use any of the API operations, you must be authorized in an IAM policy. If you're not authorized,
talk to an administrator. If you're an administrator who needs to write policies to give users access, see
[Getting Started with Policies](https://docs.cloud.oracle.com/Content/Identity/Concepts/policygetstarted.htm).

**Warning:** Oracle recommends that you avoid using any confidential information when you
supply string values using the API.

  Here is an example on how to use this:

    oci_core_security_list { 'tenant (root)/my_security_list':
      ensure                 => 'present',
      vcn                    => 'my_compartment/my_vcn',
      egress_security_rules  => [
      {
        'destination' => '0.0.0.0/0',
        'destination_type' => 'CIDR_BLOCK',
        'is_stateless' => false,
        'protocol' => 'all'
      }],
      ingress_security_rules => [
      {
        'is_stateless' => false,
        'protocol' => '6',
        'source' => '0.0.0.0/0',
        'source_type' => 'CIDR_BLOCK',
        'tcp_options' => {
          'destination_port_range' => {
            'max' => 22,
            'min' => 22
          }
        }
      },
      {
        'icmp_options' => {
          'code' => 4,
          'type' => 3
        },
        'is_stateless' => false,
        'protocol' => '1',
        'source' => '0.0.0.0/0',
        'source_type' => 'CIDR_BLOCK'
      },
      {
        'icmp_options' => {
          'type' => 3
        },
        'is_stateless' => false,
        'protocol' => '1',
        'source' => '10.0.0.0/16',
        'source_type' => 'CIDR_BLOCK'
      }],
    }

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).

## Attributes



Attribute Name                                                                 | Short Description                                                                            |
------------------------------------------------------------------------------ | -------------------------------------------------------------------------------------------- |
[absent_states](#oci_core_security_list_absent_states)                         | The OCI states, puppet will detect as the resource being absent.                             |
[compartment](#oci_core_security_list_compartment)                             | The Puppet name of the resource identified by `compartment_id`.                              |
[compartment_id](#oci_core_security_list_compartment_id)                       | The OCID of the compartment that contains the object.                                        |
[defined_tags](#oci_core_security_list_defined_tags)                           |   Defined tags for this resource.                                                            |
[disable_corrective_change](#oci_core_security_list_disable_corrective_change) | Disable the modification of a resource when Puppet decides it is a corrective change.        |
[disable_corrective_ensure](#oci_core_security_list_disable_corrective_ensure) | Disable the creation or removal of a resource when Puppet decides is a corrective change.    |
[egress_security_rules](#oci_core_security_list_egress_security_rules)         | Rules for allowing egress IP packets.                                                        |
[ensure](#oci_core_security_list_ensure)                                       | The basic property that the resource should be in.                                           |
[freeform_tags](#oci_core_security_list_freeform_tags)                         |   Free-form tags for this resource.                                                          |
[id](#oci_core_security_list_id)                                               | The OCID of the resource.                                                                    |
[ingress_security_rules](#oci_core_security_list_ingress_security_rules)       | Rules for allowing ingress IP packets.                                                       |
[lifecycle_state](#oci_core_security_list_lifecycle_state)                     | The security list's current state.                                                           |
[name](#oci_core_security_list_name)                                           | The full name of the object.                                                                 |
[oci_timeout](#oci_core_security_list_oci_timeout)                             | The maximum time to wait for the OCI resource to be in the ready state.                      |
[oci_wait_interval](#oci_core_security_list_oci_wait_interval)                 | The interval beween calls to OCI to check if a resource is in the ready state.               |
[present_states](#oci_core_security_list_present_states)                       | The OCI states, puppet will detect as the resource being present.                            |
[provider](#oci_core_security_list_provider)                                   | resource.                                                                                    |
[security_list_name](#oci_core_security_list_security_list_name)               | The name of the security_list.                                                               |
[synchronized](#oci_core_security_list_synchronized)                           | Specifies if Puppet waits for OCI actions to be ready before moving on to an other resource. |
[tenant](#oci_core_security_list_tenant)                                       | The tenant for this resource.                                                                |
[time_created](#oci_core_security_list_time_created)                           |   The date and time the security list was created, in the format defined by RFC3339.         |
[vcn](#oci_core_security_list_vcn)                                             | The Puppet name of the resource identified by `vcn_id`.                                      |
[vcn_id](#oci_core_security_list_vcn_id)                                       | The OCID of the VCN the security list belongs to.                                            |




### absent_states<a name='oci_core_security_list_absent_states'>

The OCI states, puppet will detect as the resource being absent.



[Back to overview of oci_core_security_list](#attributes)

### compartment<a name='oci_core_security_list_compartment'>

The Puppet name of the resource identified by `compartment_id`.

See the documentation of compartment_id for all details.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_security_list](#attributes)

### compartment_id<a name='oci_core_security_list_compartment_id'>

The OCID of the compartment that contains the object.

Rather use the property `compartment` instead of a direct OCID reference.

This documentation is generated from the Ruby OCI SDK.



[Back to overview of oci_core_security_list](#attributes)

### defined_tags<a name='oci_core_security_list_defined_tags'>

  Defined tags for this resource. Each key is predefined and scoped to a
namespace. For more information, see [Resource Tags](https://docs.cloud.oracle.com/Content/General/Concepts/resourcetags.htm).

Example: `{"Operations": {"CostCenter": "42"}}`

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_security_list](#attributes)

### disable_corrective_change<a name='oci_core_security_list_disable_corrective_change'>

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



[Back to overview of oci_core_security_list](#attributes)

### disable_corrective_ensure<a name='oci_core_security_list_disable_corrective_ensure'>

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



[Back to overview of oci_core_security_list](#attributes)

### egress_security_rules<a name='oci_core_security_list_egress_security_rules'>

Rules for allowing egress IP packets.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_security_list](#attributes)

### ensure<a name='oci_core_security_list_ensure'>

The basic property that the resource should be in.

Valid values are `present`, `absent`. 

[Back to overview of oci_core_security_list](#attributes)

### freeform_tags<a name='oci_core_security_list_freeform_tags'>

  Free-form tags for this resource. Each tag is a simple key-value pair with no
predefined name, type, or namespace. For more information, see [Resource Tags](https://docs.cloud.oracle.com/Content/General/Concepts/resourcetags.htm).

Example: `{"Department": "Finance"}`

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_security_list](#attributes)

### id<a name='oci_core_security_list_id'>

The OCID of the resource. This is a read-only property.

This documentation is generated from the Ruby OCI SDK.



[Back to overview of oci_core_security_list](#attributes)

### ingress_security_rules<a name='oci_core_security_list_ingress_security_rules'>

Rules for allowing ingress IP packets.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_security_list](#attributes)

### lifecycle_state<a name='oci_core_security_list_lifecycle_state'>

The security list's current state.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_security_list](#attributes)

### name<a name='oci_core_security_list_name'>

The full name of the object.



[Back to overview of oci_core_security_list](#attributes)

### oci_timeout<a name='oci_core_security_list_oci_timeout'>

The maximum time to wait for the OCI resource to be in the ready state.



[Back to overview of oci_core_security_list](#attributes)

### oci_wait_interval<a name='oci_core_security_list_oci_wait_interval'>

The interval beween calls to OCI to check if a resource is in the ready state.



[Back to overview of oci_core_security_list](#attributes)

### present_states<a name='oci_core_security_list_present_states'>

The OCI states, puppet will detect as the resource being present.



[Back to overview of oci_core_security_list](#attributes)

### provider<a name='oci_core_security_list_provider'>

The specific backend to use for this `oci_core_security_list`
resource. You will seldom need to specify this --- Puppet will usually
discover the appropriate provider for your platform.Available providers are:

sdk
: This provider uses the [Oracle Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk) to do its work.



[Back to overview of oci_core_security_list](#attributes)

### security_list_name<a name='oci_core_security_list_security_list_name'>

The name of the security_list.



[Back to overview of oci_core_security_list](#attributes)

### synchronized<a name='oci_core_security_list_synchronized'>

Specifies if Puppet waits for OCI actions to be ready before moving on to an other resource.



[Back to overview of oci_core_security_list](#attributes)

### tenant<a name='oci_core_security_list_tenant'>

The tenant for this resource.



[Back to overview of oci_core_security_list](#attributes)

### time_created<a name='oci_core_security_list_time_created'>

  The date and time the security list was created, in the format defined by RFC3339.

Example: `2016-08-25T21:10:29.600Z`

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_security_list](#attributes)

### vcn<a name='oci_core_security_list_vcn'>

The Puppet name of the resource identified by `vcn_id`.

See the documentation of vcn_id for all details.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_security_list](#attributes)

### vcn_id<a name='oci_core_security_list_vcn_id'>

The OCID of the VCN the security list belongs to.
Rather use the property `vcn` instead of a direct OCID reference.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_security_list](#attributes)
