---
title: oci core vcn
keywords: documentation
layout: documentation
sidebar: oci_config_sidebar
toc: false
---
## Overview

  A virtual cloud network (VCN). For more information, see
[Overview of the Networking Service](https://docs.cloud.oracle.com/Content/Network/Concepts/overview.htm).

To use any of the API operations, you must be authorized in an IAM policy. If you're not authorized,
talk to an administrator. If you're an administrator who needs to write policies to give users access, see
[Getting Started with Policies](https://docs.cloud.oracle.com/Content/Identity/Concepts/policygetstarted.htm).

**Warning:** Oracle recommends that you avoid using any confidential information when you
supply string values using the API.

  Here is an example on how to use this:

    oci_core_vcn { 'tenant (root)/my_vcn':
        ensure        => 'present',
        cidr_block    => '10.0.0.0/16',
        freeform_tags => {'test' => 'yes'},
      }

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).

## Attributes



Attribute Name                                                       | Short Description                                                                                                                |
-------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------- |
[absent_states](#oci_core_vcn_absent_states)                         | The OCI states, puppet will detect as the resource being absent.                                                                 |
[cidr_block](#oci_core_vcn_cidr_block)                               |   The CIDR IP address block of the VCN.                                                                                          |
[compartment](#oci_core_vcn_compartment)                             | The Puppet name of the resource identified by `compartment_id`.                                                                  |
[compartment_id](#oci_core_vcn_compartment_id)                       | The OCID of the compartment that contains the object.                                                                            |
[default_dhcp_options](#oci_core_vcn_default_dhcp_options)           | The Puppet name of the resource identified by `default_dhcp_options_id`.                                                         |
[default_dhcp_options_id](#oci_core_vcn_default_dhcp_options_id)     | The OCID for the VCN's default set of DHCP options.                                                                              |
[default_route_table](#oci_core_vcn_default_route_table)             | The Puppet name of the resource identified by `default_route_table_id`.                                                          |
[default_route_table_id](#oci_core_vcn_default_route_table_id)       | The OCID for the VCN's default route table.                                                                                      |
[default_security_list](#oci_core_vcn_default_security_list)         | The Puppet name of the resource identified by `default_security_list_id`.                                                        |
[default_security_list_id](#oci_core_vcn_default_security_list_id)   | The OCID for the VCN's default security list.                                                                                    |
[defined_tags](#oci_core_vcn_defined_tags)                           |   Defined tags for this resource.                                                                                                |
[disable_corrective_change](#oci_core_vcn_disable_corrective_change) | Disable the modification of a resource when Puppet decides it is a corrective change.                                            |
[disable_corrective_ensure](#oci_core_vcn_disable_corrective_ensure) | Disable the creation or removal of a resource when Puppet decides is a corrective change.                                        |
[dns_label](#oci_core_vcn_dns_label)                                 | within this subnet (for example, `bminstance-1.subnet123.vcn1.oraclevcn.com`).                                                   |
[ensure](#oci_core_vcn_ensure)                                       | The basic property that the resource should be in.                                                                               |
[freeform_tags](#oci_core_vcn_freeform_tags)                         |   Free-form tags for this resource.                                                                                              |
[id](#oci_core_vcn_id)                                               | The OCID of the resource.                                                                                                        |
[ipv6_cidr_block](#oci_core_vcn_ipv6_cidr_block)                     | /48 CIDR block from the supported ranges (see [IPv6 Addresses](https://docs.cloud.oracle.com/Content/Network/Concepts/ipv6.htm). |
[ipv6_public_cidr_block](#oci_core_vcn_ipv6_public_cidr_block)       |   For an IPv6-enabled VCN, this is the IPv6 CIDR block for the VCN's public IP address space.                                    |
[is_ipv6_enabled](#oci_core_vcn_is_ipv6_enabled)                     |   Whether IPv6 is enabled for the VCN.                                                                                           |
[lifecycle_state](#oci_core_vcn_lifecycle_state)                     | The VCN's current state.                                                                                                         |
[name](#oci_core_vcn_name)                                           | The full name of the object.                                                                                                     |
[oci_timeout](#oci_core_vcn_oci_timeout)                             | The maximum time to wait for the OCI resource to be in the ready state.                                                          |
[oci_wait_interval](#oci_core_vcn_oci_wait_interval)                 | The interval beween calls to OCI to check if a resource is in the ready state.                                                   |
[present_states](#oci_core_vcn_present_states)                       | The OCI states, puppet will detect as the resource being present.                                                                |
[provider](#oci_core_vcn_provider)                                   | resource.                                                                                                                        |
[synchronized](#oci_core_vcn_synchronized)                           | Specifies if Puppet waits for OCI actions to be ready before moving on to an other resource.                                     |
[tenant](#oci_core_vcn_tenant)                                       | The tenant for this resource.                                                                                                    |
[time_created](#oci_core_vcn_time_created)                           |   The date and time the VCN was created, in the format defined by RFC3339.                                                       |
[vcn_domain_name](#oci_core_vcn_vcn_domain_name)                     | `oraclevcn.com` domain.                                                                                                          |
[vcn_name](#oci_core_vcn_vcn_name)                                   | The name of the vcn.                                                                                                             |




### absent_states<a name='oci_core_vcn_absent_states'>

The OCI states, puppet will detect as the resource being absent.



[Back to overview of oci_core_vcn](#attributes)

### cidr_block<a name='oci_core_vcn_cidr_block'>

  The CIDR IP address block of the VCN.

Example: `172.16.0.0/16`

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_vcn](#attributes)

### compartment<a name='oci_core_vcn_compartment'>

The Puppet name of the resource identified by `compartment_id`.

See the documentation of compartment_id for all details.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_vcn](#attributes)

### compartment_id<a name='oci_core_vcn_compartment_id'>

The OCID of the compartment that contains the object.

Rather use the property `compartment` instead of a direct OCID reference.

This documentation is generated from the Ruby OCI SDK.



[Back to overview of oci_core_vcn](#attributes)

### default_dhcp_options<a name='oci_core_vcn_default_dhcp_options'>

The Puppet name of the resource identified by `default_dhcp_options_id`.

See the documentation of default_dhcp_options_id for all details.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_vcn](#attributes)

### default_dhcp_options_id<a name='oci_core_vcn_default_dhcp_options_id'>

The OCID for the VCN's default set of DHCP options.
Rather use the property `default_dhcp_options` instead of a direct OCID reference.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_vcn](#attributes)

### default_route_table<a name='oci_core_vcn_default_route_table'>

The Puppet name of the resource identified by `default_route_table_id`.

See the documentation of default_route_table_id for all details.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_vcn](#attributes)

### default_route_table_id<a name='oci_core_vcn_default_route_table_id'>

The OCID for the VCN's default route table.
Rather use the property `default_route_table` instead of a direct OCID reference.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_vcn](#attributes)

### default_security_list<a name='oci_core_vcn_default_security_list'>

The Puppet name of the resource identified by `default_security_list_id`.

See the documentation of default_security_list_id for all details.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_vcn](#attributes)

### default_security_list_id<a name='oci_core_vcn_default_security_list_id'>

The OCID for the VCN's default security list.
Rather use the property `default_security_list` instead of a direct OCID reference.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_vcn](#attributes)

### defined_tags<a name='oci_core_vcn_defined_tags'>

  Defined tags for this resource. Each key is predefined and scoped to a
namespace. For more information, see [Resource Tags](https://docs.cloud.oracle.com/Content/General/Concepts/resourcetags.htm).

Example: `{"Operations": {"CostCenter": "42"}}`

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_vcn](#attributes)

### disable_corrective_change<a name='oci_core_vcn_disable_corrective_change'>

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



[Back to overview of oci_core_vcn](#attributes)

### disable_corrective_ensure<a name='oci_core_vcn_disable_corrective_ensure'>

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



[Back to overview of oci_core_vcn](#attributes)

### dns_label<a name='oci_core_vcn_dns_label'>

  A DNS label for the VCN, used in conjunction with the VNIC's hostname and
subnet's DNS label to form a fully qualified domain name (FQDN) for each VNIC
within this subnet (for example, `bminstance-1.subnet123.vcn1.oraclevcn.com`).
Not required to be unique, but it's a best practice to set unique DNS labels
for VCNs in your tenancy. Must be an alphanumeric string that begins with a letter.
The value cannot be changed.

You must set this value if you want instances to be able to use hostnames to
resolve other instances in the VCN. Otherwise the Internet and VCN Resolver
will not work.

For more information, see
[DNS in Your Virtual Cloud Network](https://docs.cloud.oracle.com/Content/Network/Concepts/dns.htm).

Example: `vcn1`

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_vcn](#attributes)

### ensure<a name='oci_core_vcn_ensure'>

The basic property that the resource should be in.

Valid values are `present`, `absent`. 

[Back to overview of oci_core_vcn](#attributes)

### freeform_tags<a name='oci_core_vcn_freeform_tags'>

  Free-form tags for this resource. Each tag is a simple key-value pair with no
predefined name, type, or namespace. For more information, see [Resource Tags](https://docs.cloud.oracle.com/Content/General/Concepts/resourcetags.htm).

Example: `{"Department": "Finance"}`

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_vcn](#attributes)

### id<a name='oci_core_vcn_id'>

The OCID of the resource. This is a read-only property.

This documentation is generated from the Ruby OCI SDK.



[Back to overview of oci_core_vcn](#attributes)

### ipv6_cidr_block<a name='oci_core_vcn_ipv6_cidr_block'>

  If you enable IPv6 for the VCN (see `isIpv6Enabled`), you may optionally provide an IPv6
/48 CIDR block from the supported ranges (see [IPv6 Addresses](https://docs.cloud.oracle.com/Content/Network/Concepts/ipv6.htm).
The addresses in this block will be considered private and cannot be accessed
from the internet. The documentation refers to this as a *custom CIDR* for the VCN.

If you don't provide a custom CIDR for the VCN, Oracle assigns the VCN's IPv6 /48 CIDR block.

Regardless of whether you or Oracle assigns the `ipv6CidrBlock`,
Oracle *also* assigns the VCN an IPv6 CIDR block for the VCN's public IP address space
(see the `ipv6PublicCidrBlock` of the {Vcn} object). If you do
not assign a custom CIDR, Oracle uses the *same* Oracle-assigned CIDR for both the private
IP address space (`ipv6CidrBlock` in the `Vcn` object) and the public IP addreses space
(`ipv6PublicCidrBlock` in the `Vcn` object). This means that a given VNIC might use the same
IPv6 IP address for both private and public (internet) communication. You control whether
an IPv6 address can be used for internet communication by using the `isInternetAccessAllowed`
attribute in the {Ipv6} object.

For important details about IPv6 addressing in a VCN, see [IPv6 Addresses](https://docs.cloud.oracle.com/Content/Network/Concepts/ipv6.htm).

Example: `2001:0db8:0123::/48`

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_vcn](#attributes)

### ipv6_public_cidr_block<a name='oci_core_vcn_ipv6_public_cidr_block'>

  For an IPv6-enabled VCN, this is the IPv6 CIDR block for the VCN's public IP address space.
The VCN size is always /48. This CIDR is always provided by Oracle. If you don't provide a
custom CIDR for the `ipv6CidrBlock` when creating the VCN, Oracle assigns that value and also
uses it for `ipv6PublicCidrBlock`. Oracle uses addresses from this block for the `publicIpAddress`
attribute of an {Ipv6} that has internet access allowed.

Example: `2001:0db8:0123::/48`

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_vcn](#attributes)

### is_ipv6_enabled<a name='oci_core_vcn_is_ipv6_enabled'>

  Whether IPv6 is enabled for the VCN. Default is `false`. You cannot change this later.
For important details about IPv6 addressing in a VCN, see [IPv6 Addresses](https://docs.cloud.oracle.com/Content/Network/Concepts/ipv6.htm).

Example: `true`

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_vcn](#attributes)

### lifecycle_state<a name='oci_core_vcn_lifecycle_state'>

The VCN's current state.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_vcn](#attributes)

### name<a name='oci_core_vcn_name'>

The full name of the object.



[Back to overview of oci_core_vcn](#attributes)

### oci_timeout<a name='oci_core_vcn_oci_timeout'>

The maximum time to wait for the OCI resource to be in the ready state.



[Back to overview of oci_core_vcn](#attributes)

### oci_wait_interval<a name='oci_core_vcn_oci_wait_interval'>

The interval beween calls to OCI to check if a resource is in the ready state.



[Back to overview of oci_core_vcn](#attributes)

### present_states<a name='oci_core_vcn_present_states'>

The OCI states, puppet will detect as the resource being present.



[Back to overview of oci_core_vcn](#attributes)

### provider<a name='oci_core_vcn_provider'>

The specific backend to use for this `oci_core_vcn`
resource. You will seldom need to specify this --- Puppet will usually
discover the appropriate provider for your platform.Available providers are:

sdk
: This provider uses the [Oracle Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk) to do its work.



[Back to overview of oci_core_vcn](#attributes)

### synchronized<a name='oci_core_vcn_synchronized'>

Specifies if Puppet waits for OCI actions to be ready before moving on to an other resource.



[Back to overview of oci_core_vcn](#attributes)

### tenant<a name='oci_core_vcn_tenant'>

The tenant for this resource.



[Back to overview of oci_core_vcn](#attributes)

### time_created<a name='oci_core_vcn_time_created'>

  The date and time the VCN was created, in the format defined by RFC3339.

Example: `2016-08-25T21:10:29.600Z`

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_vcn](#attributes)

### vcn_domain_name<a name='oci_core_vcn_vcn_domain_name'>

  The VCN's domain name, which consists of the VCN's DNS label, and the
`oraclevcn.com` domain.

For more information, see
[DNS in Your Virtual Cloud Network](https://docs.cloud.oracle.com/Content/Network/Concepts/dns.htm).

Example: `vcn1.oraclevcn.com`

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_vcn](#attributes)

### vcn_name<a name='oci_core_vcn_vcn_name'>

The name of the vcn.



[Back to overview of oci_core_vcn](#attributes)
