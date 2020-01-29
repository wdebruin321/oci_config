---
layout: documentation
title: Naming OCI resources in Puppet
keywords: 
sidebar: oci_config_sidebar
toc: false
---
# Resource naming
There are some differences in how OCI approaches the naming of resources and how Puppet approaches this. In this chapter, we will explain these differences and tell you how to work with it in Puppet.

## Structure of a name
In Puppet all resources are named like this: `tenant (root)/compartment/sub_compartment/resource_name`.  As you can see, the tenant is part of the full resource name. This means that your Puppet manifest can contain resources in multiple tenants. This is especially convenient for larger organizations.

## Readable resource names over ID's
In Puppet, the name of the resource is the unique identifier of a resource. In OCI, the OCID (Oracle Cloud ID) is the unique identifier of the resources.  To make it easy for humans to identify a resource, OCI has a "display name".  Because Puppet manifests are all about easy readability for humans, we have decided to focus on the usage of human-readable resource names. If you want to, you can still use the OCID properties (e.g., all properties which name ends on `_id` or `_ids`), but we encourage you to use the name attributes. Under the hood, Puppet will take care of these names and automatically translate it to the OCID when doing the call to OCI.

In reference properties, you **cannot** use a resource in a different tenant. So when you reference another OCI resource, remove the part before the first slash (e.g., the part until the `(root)/` string). Here is an example of a valid reference:

``` puppet
 oci_core_volume_group { 'tenant (root)/my_volume_group}':
   ensure => 'present',
  ....
   volumes => ['my_compartment/test_volume_1', ['other_compartment/test_volume_1'],
 }
```
In this example, the title contains the full name, and the `volumes` property contains relative names.

## Unique resource names
In Puppet, all resource names **must** be unique.  This is Puppet's way of ensuring you don't manage a resource twice with a different configuration.  In OCI, however, many resources can have the same name.  OCI uses a `display_name`  attribute to show something readable. We have decided that to use OCI with Puppet, The display names **MUST** be unique. To make it a little bit more precise, it must be unique within a compartment. 

When you use Puppet only to manage the OCI config, that is not a problem. If you, however, change resources through the console web application or Terraform, you have to take care of this yourself.

## Renaming resources
A side effect of OCI using the OCID as a unique identifier, OCI allows you to change the (display)name of an object. In Puppet, you cannot do this. If you want to rename a resource, you have to remove it first and then recreate it.
