---
layout: documentation
title: Description oci_config
keywords: 
sidebar: oci_config_sidebar
toc: false
---
The `oci_config` module extends the Puppet language to contain types needed to create and manage the lifecycle of objects within your Oracle Cloud Infrastructure. Although this is traditionally the domain of Terraform scripts, being able to manage these objects with Puppet, has proven to be a big plus for many customers. For example:

- Your organization is already using Puppet and **not** terraform.  Introducing a new tool into your organization might be more then you want or need. In these cases, Puppet, in combination with this module, is a great help.
- You want to use existing hiera data to configure parts of your OCI infrastructure. In this case, using this module is great. It integrates with all of the existing hieradata, just like your other Puppet code.
- You need tighter integration between OCI configuration in general and the configuration management **on** your systems. Again, this module is for you. It is regular Puppet so you can use **all** of the rich puppet features like exported resources to integrate all of your configuration settings both ion the cloud level as well as on the machines.


This module provides the same functionality as the Terraform provider for OCI. At this point in time the following types are implemented for the follwoing services

## Budget services

- [oci_budget_budget](/docs/oci_config/.htmloci_budget_budget.html)

## Core services

- [oci_core_boot_volume](/docs/oci_config/oci_core_boot_volume.html)
- [oci_core_boot_volume_backup](/docs/oci_config/oci_core_boot_volume_backup.html)
- [oci_core_cpe](/docs/oci_config/oci_core_cpe.html)
- [oci_core_dedicated_vm_host](/docs/oci_config/oci_core_dedicated_vm_host.html)
- [oci_core_dhcp_options](/docs/oci_config/oci_core_dhcp_options.html)
- [oci_core_drg](/docs/oci_config/oci_core_drg.html)
- [oci_core_image](/docs/oci_config/oci_core_image.html)
- [oci_core_instance](/docs/oci_config/oci_core_instance.html)
- [oci_core_instance_console_connection](/docs/oci_config/oci_core_instance_console_connection.html)
- [oci_core_internet_gateway](/docs/oci_config/oci_core_internet_gateway.html)
- [oci_core_ip_sec_connection](/docs/oci_config/oci_core_ip_sec_connection.html)
- [oci_core_local_peering_gateway](/docs/oci_config/oci_core_local_peering_gateway.html)
- [oci_core_nat_gateway](/docs/oci_config/oci_core_nat_gateway.html)
- [oci_core_network_security_group](/docs/oci_config/oci_core_network_security_group.html)
- [oci_core_remote_peering_connection](/docs/oci_config/oci_core_remote_peering_connection.html)
- [oci_core_route_table](/docs/oci_config/oci_core_route_table.html)
- [oci_core_security_list](/docs/oci_config/oci_core_security_list.html)
- [oci_core_service_gateway](/docs/oci_config/oci_core_service_gateway.html)
- [oci_core_subnet](/docs/oci_config/oci_core_subnet.html)
- [oci_core_vcn](/docs/oci_config/oci_core_vcn.html)
- [oci_core_virtual_circuit](/docs/oci_config/oci_core_virtual_circuit.html)
- [oci_core_volume](/docs/oci_config/oci_core_volume.html)
- [oci_core_volume_backup](/docs/oci_config/oci_core_volume_backup.html)
- [oci_core_volume_backup_policy](/docs/oci_config/oci_core_volume_backup_policy.html)
- [oci_core_volume_group](/docs/oci_config/oci_core_volume_group.html)
- [oci_core_volume_group_backup](/docs/oci_config/oci_core_volume_group_backup.html)

## Identity Services

- [oci_identity_compartment](/docs/oci_config/oci_identity_compartment.html)
- [oci_identity_dynamic_group](/docs/oci_config/oci_identity_dynamic_group.html)
- [oci_identity_group](/docs/oci_config/oci_identity_group.html)
- [oci_identity_identity_provider](/docs/oci_config/oci_identity_identity_provider.html)
- [oci_identity_policy](/docs/oci_config/oci_identity_policy.html)
- [oci_identity_tag_namespace](/docs/oci_config/oci_identity_tag_namespace.html)
- [oci_identity_user](/docs/oci_config/oci_identity_user.html)

## Generic[](/docs/oci_config/)

- [oci_tenant](/docs/oci_config/oci_tenant.html)