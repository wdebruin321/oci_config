---
title: oci core dhcp options
keywords: documentation
layout: documentation
sidebar: oci_config_sidebar
toc: false
---
## Overview

  A set of DHCP options. Used by the VCN to automatically provide configuration
information to the instances when they boot up. There are two options you can set:

- {DhcpDnsOption}: Lets you specify how DNS (hostname resolution) is
handled in the subnets in your VCN.

- {DhcpSearchDomainOption}: Lets you specify
a search domain name to use for DNS queries.

For more information, see  [DNS in Your Virtual Cloud Network](https://docs.cloud.oracle.com/Content/Network/Concepts/dns.htm)
and [DHCP Options](https://docs.cloud.oracle.com/Content/Network/Tasks/managingDHCP.htm).

To use any of the API operations, you must be authorized in an IAM policy. If you're not authorized,
talk to an administrator. If you're an administrator who needs to write policies to give users access, see
[Getting Started with Policies](https://docs.cloud.oracle.com/Content/Identity/Concepts/policygetstarted.htm).

**Warning:** Oracle recommends that you avoid using any confidential information when you
supply string values using the API.

  Here is an example on how to use this:

    oci_core_dhcp_options { 'tenant (root)/my_options':
      ensure          => 'present',
      options         => [
      {
        'type' => 'DomainNameServer',
        'custom_dns_servers' => [],
        'server_type' => 'VcnLocalPlusInternet'
      },
      {
        'type' => 'SearchDomain',
        'search_domain_names' => ['vcn.oraclevcn.com']
      }],
      vcn => 'VirtualCloudNetwork-20200103-0949',
    }

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).

## Attributes



Attribute Name                                                                | Short Description                                                                            |
----------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------- |
[absent_states](#oci_core_dhcp_options_absent_states)                         | The OCI states, puppet will detect as the resource being absent.                             |
[compartment](#oci_core_dhcp_options_compartment)                             | The Puppet name of the resource identified by `compartment_id`.                              |
[compartment_id](#oci_core_dhcp_options_compartment_id)                       | The OCID of the compartment that contains the object.                                        |
[defined_tags](#oci_core_dhcp_options_defined_tags)                           |   Defined tags for this resource.                                                            |
[dhcp_options_name](#oci_core_dhcp_options_dhcp_options_name)                 | The name of the dhcp_options.                                                                |
[disable_corrective_change](#oci_core_dhcp_options_disable_corrective_change) | Disable the modification of a resource when Puppet decides it is a corrective change.        |
[disable_corrective_ensure](#oci_core_dhcp_options_disable_corrective_ensure) | Disable the creation or removal of a resource when Puppet decides is a corrective change.    |
[ensure](#oci_core_dhcp_options_ensure)                                       | The basic property that the resource should be in.                                           |
[freeform_tags](#oci_core_dhcp_options_freeform_tags)                         |   Free-form tags for this resource.                                                          |
[id](#oci_core_dhcp_options_id)                                               | The OCID of the resource.                                                                    |
[lifecycle_state](#oci_core_dhcp_options_lifecycle_state)                     | The current state of the set of DHCP options.                                                |
[name](#oci_core_dhcp_options_name)                                           | The full name of the object.                                                                 |
[oci_timeout](#oci_core_dhcp_options_oci_timeout)                             | The maximum time to wait for the OCI resource to be in the ready state.                      |
[oci_wait_interval](#oci_core_dhcp_options_oci_wait_interval)                 | The interval beween calls to OCI to check if a resource is in the ready state.               |
[options](#oci_core_dhcp_options_options)                                     | A set of DHCP options.                                                                       |
[present_states](#oci_core_dhcp_options_present_states)                       | The OCI states, puppet will detect as the resource being present.                            |
[provider](#oci_core_dhcp_options_provider)                                   | resource.                                                                                    |
[synchronized](#oci_core_dhcp_options_synchronized)                           | Specifies if Puppet waits for OCI actions to be ready before moving on to an other resource. |
[tenant](#oci_core_dhcp_options_tenant)                                       | The tenant for this resource.                                                                |
[time_created](#oci_core_dhcp_options_time_created)                           |   Date and time the set of DHCP options was created, in the format defined by RFC3339.       |
[vcn](#oci_core_dhcp_options_vcn)                                             | The Puppet name of the resource identified by `vcn_id`.                                      |
[vcn_id](#oci_core_dhcp_options_vcn_id)                                       | The OCID of the VCN the set of DHCP options belongs to.                                      |




### absent_states<a name='oci_core_dhcp_options_absent_states'>

The OCI states, puppet will detect as the resource being absent.



[Back to overview of oci_core_dhcp_options](#attributes)

### compartment<a name='oci_core_dhcp_options_compartment'>

The Puppet name of the resource identified by `compartment_id`.

See the documentation of compartment_id for all details.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_dhcp_options](#attributes)

### compartment_id<a name='oci_core_dhcp_options_compartment_id'>

The OCID of the compartment that contains the object.

Rather use the property `compartment` instead of a direct OCID reference.

This documentation is generated from the Ruby OCI SDK.



[Back to overview of oci_core_dhcp_options](#attributes)

### defined_tags<a name='oci_core_dhcp_options_defined_tags'>

  Defined tags for this resource. Each key is predefined and scoped to a
namespace. For more information, see [Resource Tags](https://docs.cloud.oracle.com/Content/General/Concepts/resourcetags.htm).

Example: `{"Operations": {"CostCenter": "42"}}`

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_dhcp_options](#attributes)

### dhcp_options_name<a name='oci_core_dhcp_options_dhcp_options_name'>

The name of the dhcp_options.



[Back to overview of oci_core_dhcp_options](#attributes)

### disable_corrective_change<a name='oci_core_dhcp_options_disable_corrective_change'>

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



[Back to overview of oci_core_dhcp_options](#attributes)

### disable_corrective_ensure<a name='oci_core_dhcp_options_disable_corrective_ensure'>

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



[Back to overview of oci_core_dhcp_options](#attributes)

### ensure<a name='oci_core_dhcp_options_ensure'>

The basic property that the resource should be in.

Valid values are `present`, `absent`. 

[Back to overview of oci_core_dhcp_options](#attributes)

### freeform_tags<a name='oci_core_dhcp_options_freeform_tags'>

  Free-form tags for this resource. Each tag is a simple key-value pair with no
predefined name, type, or namespace. For more information, see [Resource Tags](https://docs.cloud.oracle.com/Content/General/Concepts/resourcetags.htm).

Example: `{"Department": "Finance"}`

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_dhcp_options](#attributes)

### id<a name='oci_core_dhcp_options_id'>

The OCID of the resource. This is a read-only property.

This documentation is generated from the Ruby OCI SDK.



[Back to overview of oci_core_dhcp_options](#attributes)

### lifecycle_state<a name='oci_core_dhcp_options_lifecycle_state'>

The current state of the set of DHCP options.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_dhcp_options](#attributes)

### name<a name='oci_core_dhcp_options_name'>

The full name of the object.



[Back to overview of oci_core_dhcp_options](#attributes)

### oci_timeout<a name='oci_core_dhcp_options_oci_timeout'>

The maximum time to wait for the OCI resource to be in the ready state.



[Back to overview of oci_core_dhcp_options](#attributes)

### oci_wait_interval<a name='oci_core_dhcp_options_oci_wait_interval'>

The interval beween calls to OCI to check if a resource is in the ready state.



[Back to overview of oci_core_dhcp_options](#attributes)

### options<a name='oci_core_dhcp_options_options'>

A set of DHCP options.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_dhcp_options](#attributes)

### present_states<a name='oci_core_dhcp_options_present_states'>

The OCI states, puppet will detect as the resource being present.



[Back to overview of oci_core_dhcp_options](#attributes)

### provider<a name='oci_core_dhcp_options_provider'>

The specific backend to use for this `oci_core_dhcp_options`
resource. You will seldom need to specify this --- Puppet will usually
discover the appropriate provider for your platform.Available providers are:

sdk
: This provider uses the [Oracle Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk) to do its work.



[Back to overview of oci_core_dhcp_options](#attributes)

### synchronized<a name='oci_core_dhcp_options_synchronized'>

Specifies if Puppet waits for OCI actions to be ready before moving on to an other resource.



[Back to overview of oci_core_dhcp_options](#attributes)

### tenant<a name='oci_core_dhcp_options_tenant'>

The tenant for this resource.



[Back to overview of oci_core_dhcp_options](#attributes)

### time_created<a name='oci_core_dhcp_options_time_created'>

  Date and time the set of DHCP options was created, in the format defined by RFC3339.

Example: `2016-08-25T21:10:29.600Z`

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_dhcp_options](#attributes)

### vcn<a name='oci_core_dhcp_options_vcn'>

The Puppet name of the resource identified by `vcn_id`.

See the documentation of vcn_id for all details.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_dhcp_options](#attributes)

### vcn_id<a name='oci_core_dhcp_options_vcn_id'>

The OCID of the VCN the set of DHCP options belongs to.
Rather use the property `vcn` instead of a direct OCID reference.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_dhcp_options](#attributes)
