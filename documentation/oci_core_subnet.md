---
title: oci core subnet
keywords: documentation
layout: documentation
sidebar: oci_config_sidebar
toc: false
---
## Overview

  A logical subdivision of a VCN. Each subnet
consists of a contiguous range of IP addresses that do not overlap with
other subnets in the VCN. Example: 172.16.1.0/24. For more information, see
[Overview of the Networking Service](https://docs.cloud.oracle.com/Content/Network/Concepts/overview.htm) and
[VCNs and Subnets](https://docs.cloud.oracle.com/Content/Network/Tasks/managingVCNs.htm).

To use any of the API operations, you must be authorized in an IAM policy. If you're not authorized,
talk to an administrator. If you're an administrator who needs to write policies to give users access, see
[Getting Started with Policies](https://docs.cloud.oracle.com/Content/Identity/Concepts/policygetstarted.htm).

**Warning:** Oracle recommends that you avoid using any confidential information when you
supply string values using the API.

  Here is an example on how to use this:

    oci_core_subnet { 'tenant (root)/my_subnet':
      ensure             => 'present',
      cidr_block         => '10.0.0.0/24',
      dhcp_options       => 'my_compartment/my_dhcp_options',
      dns_label          => 'subnet',
      route_table        => 'my_compartment/my_route_table_',
      security_lists     => ['my_compartment/my_security_list_'],
      subnet_domain_name => 'subnet.vcn.oraclevcn.com',
      vcn                => 'my_compartment/my_vcn',
      virtual_router_ip  => '10.0.0.1',
      virtual_router_mac => '00:00:17:9B:B0:3F',
    }

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).

## Attributes



Attribute Name                                                            | Short Description                                                                            |
------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------- |
[absent_states](#oci_core_subnet_absent_states)                           | The OCI states, puppet will detect as the resource being absent.                             |
[availability_domain](#oci_core_subnet_availability_domain)               |   Controls whether the subnet is regional or specific to an availability domain.             |
[cidr_block](#oci_core_subnet_cidr_block)                                 |   The CIDR IP address range of the subnet.                                                   |
[compartment](#oci_core_subnet_compartment)                               | The Puppet name of the resource identified by `compartment_id`.                              |
[compartment_id](#oci_core_subnet_compartment_id)                         | The OCID of the compartment that contains the object.                                        |
[defined_tags](#oci_core_subnet_defined_tags)                             |   Defined tags for this resource.                                                            |
[dhcp_options](#oci_core_subnet_dhcp_options)                             | The Puppet name of the resource identified by `dhcp_options_id`.                             |
[dhcp_options_id](#oci_core_subnet_dhcp_options_id)                       |   The OCID of the set of DHCP options the subnet will use.                                   |
[disable_corrective_change](#oci_core_subnet_disable_corrective_change)   | Disable the modification of a resource when Puppet decides it is a corrective change.        |
[disable_corrective_ensure](#oci_core_subnet_disable_corrective_ensure)   | Disable the creation or removal of a resource when Puppet decides is a corrective change.    |
[dns_label](#oci_core_subnet_dns_label)                                   | within this subnet (for example, `bminstance-1.subnet123.vcn1.oraclevcn.com`).               |
[ensure](#oci_core_subnet_ensure)                                         | The basic property that the resource should be in.                                           |
[freeform_tags](#oci_core_subnet_freeform_tags)                           |   Free-form tags for this resource.                                                          |
[id](#oci_core_subnet_id)                                                 | The OCID of the resource.                                                                    |
[ipv6_cidr_block](#oci_core_subnet_ipv6_cidr_block)                       |   Use this to enable IPv6 addressing for this subnet.                                        |
[ipv6_public_cidr_block](#oci_core_subnet_ipv6_public_cidr_block)         | space.                                                                                       |
[ipv6_virtual_router_ip](#oci_core_subnet_ipv6_virtual_router_ip)         |   For an IPv6-enabled subnet, this is the IPv6 address of the virtual router.                |
[lifecycle_state](#oci_core_subnet_lifecycle_state)                       | The subnet's current state.                                                                  |
[name](#oci_core_subnet_name)                                             | The full name of the object.                                                                 |
[oci_timeout](#oci_core_subnet_oci_timeout)                               | The maximum time to wait for the OCI resource to be in the ready state.                      |
[oci_wait_interval](#oci_core_subnet_oci_wait_interval)                   | The interval beween calls to OCI to check if a resource is in the ready state.               |
[present_states](#oci_core_subnet_present_states)                         | The OCI states, puppet will detect as the resource being present.                            |
[prohibit_public_ip_on_vnic](#oci_core_subnet_prohibit_public_ip_on_vnic) |   Whether VNICs within this subnet can have public IP addresses.                             |
[provider](#oci_core_subnet_provider)                                     | resource.                                                                                    |
[route_table](#oci_core_subnet_route_table)                               | The Puppet name of the resource identified by `route_table_id`.                              |
[route_table_id](#oci_core_subnet_route_table_id)                         |   The OCID of the route table the subnet will use.                                           |
[security_list_ids](#oci_core_subnet_security_list_ids)                   |   The OCIDs of the security list or lists the subnet will use.                               |
[security_lists](#oci_core_subnet_security_lists)                         | The Puppet name of the resource identified by `security_list_ids`.                           |
[subnet_domain_name](#oci_core_subnet_subnet_domain_name)                 | the VCN's DNS label, and the `oraclevcn.com` domain.                                         |
[subnet_name](#oci_core_subnet_subnet_name)                               | The name of the subnet.                                                                      |
[synchronized](#oci_core_subnet_synchronized)                             | Specifies if Puppet waits for OCI actions to be ready before moving on to an other resource. |
[tenant](#oci_core_subnet_tenant)                                         | The tenant for this resource.                                                                |
[time_created](#oci_core_subnet_time_created)                             |   The date and time the subnet was created, in the format defined by RFC3339.                |
[vcn](#oci_core_subnet_vcn)                                               | The Puppet name of the resource identified by `vcn_id`.                                      |
[vcn_id](#oci_core_subnet_vcn_id)                                         | The OCID of the VCN to contain the subnet.                                                   |
[virtual_router_ip](#oci_core_subnet_virtual_router_ip)                   |   The IP address of the virtual router.                                                      |
[virtual_router_mac](#oci_core_subnet_virtual_router_mac)                 |   The MAC address of the virtual router.                                                     |




### absent_states<a name='oci_core_subnet_absent_states'>

The OCI states, puppet will detect as the resource being absent.



[Back to overview of oci_core_subnet](#attributes)

### availability_domain<a name='oci_core_subnet_availability_domain'>

  Controls whether the subnet is regional or specific to an availability domain. Oracle
recommends creating regional subnets because they're more flexible and make it easier to
implement failover across availability domains. Originally, AD-specific subnets were the
only kind available to use.

To create a regional subnet, omit this attribute. Then any resources later created in this
subnet (such as a Compute instance) can be created in any availability domain in the region.

To instead create an AD-specific subnet, set this attribute to the availability domain you
want this subnet to be in. Then any resources later created in this subnet can only be
created in that availability domain.

Example: `Uocm:PHX-AD-1`

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_subnet](#attributes)

### cidr_block<a name='oci_core_subnet_cidr_block'>

  The CIDR IP address range of the subnet.

Example: `172.16.1.0/24`

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_subnet](#attributes)

### compartment<a name='oci_core_subnet_compartment'>

The Puppet name of the resource identified by `compartment_id`.

See the documentation of compartment_id for all details.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_subnet](#attributes)

### compartment_id<a name='oci_core_subnet_compartment_id'>

The OCID of the compartment that contains the object.

Rather use the property `compartment` instead of a direct OCID reference.

This documentation is generated from the Ruby OCI SDK.



[Back to overview of oci_core_subnet](#attributes)

### defined_tags<a name='oci_core_subnet_defined_tags'>

  Defined tags for this resource. Each key is predefined and scoped to a
namespace. For more information, see [Resource Tags](https://docs.cloud.oracle.com/Content/General/Concepts/resourcetags.htm).

Example: `{"Operations": {"CostCenter": "42"}}`

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_subnet](#attributes)

### dhcp_options<a name='oci_core_subnet_dhcp_options'>

The Puppet name of the resource identified by `dhcp_options_id`.

See the documentation of dhcp_options_id for all details.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_subnet](#attributes)

### dhcp_options_id<a name='oci_core_subnet_dhcp_options_id'>

  The OCID of the set of DHCP options the subnet will use. If you don't
provide a value, the subnet uses the VCN's default set of DHCP options.
  Rather use the property `dhcp_options` instead of a direct OCID reference.

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_subnet](#attributes)

### disable_corrective_change<a name='oci_core_subnet_disable_corrective_change'>

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



[Back to overview of oci_core_subnet](#attributes)

### disable_corrective_ensure<a name='oci_core_subnet_disable_corrective_ensure'>

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



[Back to overview of oci_core_subnet](#attributes)

### dns_label<a name='oci_core_subnet_dns_label'>

  A DNS label for the subnet, used in conjunction with the VNIC's hostname and
VCN's DNS label to form a fully qualified domain name (FQDN) for each VNIC
within this subnet (for example, `bminstance-1.subnet123.vcn1.oraclevcn.com`).
Must be an alphanumeric string that begins with a letter and is unique within the VCN.
The value cannot be changed.

This value must be set if you want to use the Internet and VCN Resolver to resolve the
hostnames of instances in the subnet. It can only be set if the VCN itself
was created with a DNS label.

For more information, see
[DNS in Your Virtual Cloud Network](https://docs.cloud.oracle.com/Content/Network/Concepts/dns.htm).

Example: `subnet123`

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_subnet](#attributes)

### ensure<a name='oci_core_subnet_ensure'>

The basic property that the resource should be in.

Valid values are `present`, `absent`. 

[Back to overview of oci_core_subnet](#attributes)

### freeform_tags<a name='oci_core_subnet_freeform_tags'>

  Free-form tags for this resource. Each tag is a simple key-value pair with no
predefined name, type, or namespace. For more information, see [Resource Tags](https://docs.cloud.oracle.com/Content/General/Concepts/resourcetags.htm).

Example: `{"Department": "Finance"}`

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_subnet](#attributes)

### id<a name='oci_core_subnet_id'>

The OCID of the resource. This is a read-only property.

This documentation is generated from the Ruby OCI SDK.



[Back to overview of oci_core_subnet](#attributes)

### ipv6_cidr_block<a name='oci_core_subnet_ipv6_cidr_block'>

  Use this to enable IPv6 addressing for this subnet. The VCN must be enabled for IPv6.
You can't change this subnet characteristic later. All subnets are /64 in size. The subnet
portion of the IPv6 address is the fourth hextet from the left (1111 in the following example).

For important details about IPv6 addressing in a VCN, see [IPv6 Addresses](https://docs.cloud.oracle.com/Content/Network/Concepts/ipv6.htm).

Example: `2001:0db8:0123:1111::/64`

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_subnet](#attributes)

### ipv6_public_cidr_block<a name='oci_core_subnet_ipv6_public_cidr_block'>

  For an IPv6-enabled subnet, this is the IPv6 CIDR block for the subnet's public IP address
space. The subnet size is always /64. The left 48 bits are inherited from the
`ipv6PublicCidrBlock` of the {Vcn},
and the remaining 16 bits are from the subnet's `ipv6CidrBlock`.

Example: `2001:0db8:0123:1111::/64`

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_subnet](#attributes)

### ipv6_virtual_router_ip<a name='oci_core_subnet_ipv6_virtual_router_ip'>

  For an IPv6-enabled subnet, this is the IPv6 address of the virtual router.

Example: `2001:0db8:0123:1111:89ab:cdef:1234:5678`

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_subnet](#attributes)

### lifecycle_state<a name='oci_core_subnet_lifecycle_state'>

The subnet's current state.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_subnet](#attributes)

### name<a name='oci_core_subnet_name'>

The full name of the object.



[Back to overview of oci_core_subnet](#attributes)

### oci_timeout<a name='oci_core_subnet_oci_timeout'>

The maximum time to wait for the OCI resource to be in the ready state.



[Back to overview of oci_core_subnet](#attributes)

### oci_wait_interval<a name='oci_core_subnet_oci_wait_interval'>

The interval beween calls to OCI to check if a resource is in the ready state.



[Back to overview of oci_core_subnet](#attributes)

### present_states<a name='oci_core_subnet_present_states'>

The OCI states, puppet will detect as the resource being present.



[Back to overview of oci_core_subnet](#attributes)

### prohibit_public_ip_on_vnic<a name='oci_core_subnet_prohibit_public_ip_on_vnic'>

  Whether VNICs within this subnet can have public IP addresses.
Defaults to false, which means VNICs created in this subnet will
automatically be assigned public IP addresses unless specified
otherwise during instance launch or VNIC creation (with the
`assignPublicIp` flag in {CreateVnicDetails}).
If `prohibitPublicIpOnVnic` is set to true, VNICs created in this
subnet cannot have public IP addresses (that is, it's a private
subnet).

For IPv6, if `prohibitPublicIpOnVnic` is set to `true`, internet access is not allowed for any
IPv6s assigned to VNICs in the subnet.

Example: `true`

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_subnet](#attributes)

### provider<a name='oci_core_subnet_provider'>

The specific backend to use for this `oci_core_subnet`
resource. You will seldom need to specify this --- Puppet will usually
discover the appropriate provider for your platform.Available providers are:

sdk
: This provider uses the [Oracle Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk) to do its work.



[Back to overview of oci_core_subnet](#attributes)

### route_table<a name='oci_core_subnet_route_table'>

The Puppet name of the resource identified by `route_table_id`.

See the documentation of route_table_id for all details.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_subnet](#attributes)

### route_table_id<a name='oci_core_subnet_route_table_id'>

  The OCID of the route table the subnet will use. If you don't provide a value,
the subnet uses the VCN's default route table.
  Rather use the property `route_table` instead of a direct OCID reference.

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_subnet](#attributes)

### security_list_ids<a name='oci_core_subnet_security_list_ids'>

  The OCIDs of the security list or lists the subnet will use. If you don't
provide a value, the subnet uses the VCN's default security list.
Remember that security lists are associated *with the subnet*, but the
rules are applied to the individual VNICs in the subnet.
  Rather use the property `security_lists` instead of a direct OCID reference.

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_subnet](#attributes)

### security_lists<a name='oci_core_subnet_security_lists'>

The Puppet name of the resource identified by `security_list_ids`.

See the documentation of security_list_ids for all details.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_subnet](#attributes)

### subnet_domain_name<a name='oci_core_subnet_subnet_domain_name'>

  The subnet's domain name, which consists of the subnet's DNS label,
the VCN's DNS label, and the `oraclevcn.com` domain.

For more information, see
[DNS in Your Virtual Cloud Network](https://docs.cloud.oracle.com/Content/Network/Concepts/dns.htm).

Example: `subnet123.vcn1.oraclevcn.com`

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_subnet](#attributes)

### subnet_name<a name='oci_core_subnet_subnet_name'>

The name of the subnet.



[Back to overview of oci_core_subnet](#attributes)

### synchronized<a name='oci_core_subnet_synchronized'>

Specifies if Puppet waits for OCI actions to be ready before moving on to an other resource.



[Back to overview of oci_core_subnet](#attributes)

### tenant<a name='oci_core_subnet_tenant'>

The tenant for this resource.



[Back to overview of oci_core_subnet](#attributes)

### time_created<a name='oci_core_subnet_time_created'>

  The date and time the subnet was created, in the format defined by RFC3339.

Example: `2016-08-25T21:10:29.600Z`

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_subnet](#attributes)

### vcn<a name='oci_core_subnet_vcn'>

The Puppet name of the resource identified by `vcn_id`.

See the documentation of vcn_id for all details.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_subnet](#attributes)

### vcn_id<a name='oci_core_subnet_vcn_id'>

The OCID of the VCN to contain the subnet.
Rather use the property `vcn` instead of a direct OCID reference.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_subnet](#attributes)

### virtual_router_ip<a name='oci_core_subnet_virtual_router_ip'>

  The IP address of the virtual router.

Example: `10.0.14.1`

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_subnet](#attributes)

### virtual_router_mac<a name='oci_core_subnet_virtual_router_mac'>

  The MAC address of the virtual router.

Example: `00:00:17:B6:4D:DD`

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_subnet](#attributes)
