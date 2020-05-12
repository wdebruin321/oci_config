---
title: oci tenant
keywords: documentation
layout: documentation
sidebar: _sidebar
toc: false
---
## Overview

The tenant identifier.

To get started with OCI in Puppet, you first have to identify the tenant you will use. See [this article](https://docs.cloud.oracle.com/en-us/iaas/Content/GSG/Concepts/settinguptenancy.htm) on how you can set up a tenancy in OCI.

Based on this information you can identify yourself to Puppet:

    oci_tenant {'tenant':
      tenancy_ocid => 'ocid1.tenancy.oc1..aaaaaaaaqf48mdndf7mmzgtbhyaqyyqlnjqj42ezgitogrfnz2a5qbw3mqa',
      user_ocid    => 'ocid1.user.oc1..aaaaaaaaw4yqam25cqygpst5e2eepr7nukpn2chf3ds6ftcypttw7tmkqyga',
      fingerprint  => '72:22:6d:f8:02:de:ee:6e:f5:a7:95:b9:72:f3:d8:eb',
      region       => 'eu-frankfurt-1',
      private_key  => "
    -----BEGIN RSA PRIVATE KEY-----
    ....

    MIIEpQIBAAKCAQEA4Qtpf303eu65bPKGXloBgfXTK4TwGzRdpHngxmWwZrEm/E3j
    ...
    -----END RSA PRIVATE KEY-----"
      }

## Attributes



Attribute Name                                                     | Short Description                                                                         |
------------------------------------------------------------------ | ----------------------------------------------------------------------------------------- |
[disable_corrective_change](#oci_tenant_disable_corrective_change) | Disable the modification of a resource when Puppet decides it is a corrective change.     |
[disable_corrective_ensure](#oci_tenant_disable_corrective_ensure) | Disable the creation or removal of a resource when Puppet decides is a corrective change. |
[facts](#oci_tenant_facts)                                         | The facts you want to enable on this tennant.                                             |
[fingerprint](#oci_tenant_fingerprint)                             | SSL Fingerprint to use for authentication.                                                |
[name](#oci_tenant_name)                                           | The name of the setting.                                                                  |
[private_key](#oci_tenant_private_key)                             | Client private key content.                                                               |
[private_key_password](#oci_tenant_private_key_password)           | Pass phrase used for key file, if it is encrypted.                                        |
[provider](#oci_tenant_provider)                                   | resource.                                                                                 |
[proxy_address](#oci_tenant_proxy_address)                         | Address (fqdn) of the proxy server.                                                       |
[proxy_password](#oci_tenant_proxy_password)                       | Proxy password.                                                                           |
[proxy_port](#oci_tenant_proxy_port)                               | IP port of the proxy server.                                                              |
[proxy_user](#oci_tenant_proxy_user)                               | Username for the proxy.                                                                   |
[region](#oci_tenant_region)                                       | A region to use for APIs created with this instance.                                      |
[tenancy_ocid](#oci_tenant_tenancy_ocid)                           | OCID of the tenancy to use for authentication.                                            |
[user_ocid](#oci_tenant_user_ocid)                                 | OCID of the user to use for authentication.                                               |




### disable_corrective_change<a name='oci_tenant_disable_corrective_change'>

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



[Back to overview of oci_tenant](#attributes)

### disable_corrective_ensure<a name='oci_tenant_disable_corrective_ensure'>

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



[Back to overview of oci_tenant](#attributes)

### facts<a name='oci_tenant_facts'>

The facts you want to enable on this tennant.



[Back to overview of oci_tenant](#attributes)

### fingerprint<a name='oci_tenant_fingerprint'>

SSL Fingerprint to use for authentication.



[Back to overview of oci_tenant](#attributes)

### name<a name='oci_tenant_name'>

The name of the setting.



[Back to overview of oci_tenant](#attributes)

### private_key<a name='oci_tenant_private_key'>

Client private key content.



[Back to overview of oci_tenant](#attributes)

### private_key_password<a name='oci_tenant_private_key_password'>

Pass phrase used for key file, if it is encrypted.



[Back to overview of oci_tenant](#attributes)

### provider<a name='oci_tenant_provider'>

The specific backend to use for this `oci_tenant`
resource. You will seldom need to specify this --- Puppet will usually
discover the appropriate provider for your platform.Available providers are:

simple
: Manage oci tenant through yaml file



[Back to overview of oci_tenant](#attributes)

### proxy_address<a name='oci_tenant_proxy_address'>

Address (fqdn) of the proxy server.



[Back to overview of oci_tenant](#attributes)

### proxy_password<a name='oci_tenant_proxy_password'>

Proxy password.



[Back to overview of oci_tenant](#attributes)

### proxy_port<a name='oci_tenant_proxy_port'>

IP port of the proxy server.



[Back to overview of oci_tenant](#attributes)

### proxy_user<a name='oci_tenant_proxy_user'>

Username for the proxy.



[Back to overview of oci_tenant](#attributes)

### region<a name='oci_tenant_region'>

A region to use for APIs created with this instance.



[Back to overview of oci_tenant](#attributes)

### tenancy_ocid<a name='oci_tenant_tenancy_ocid'>

OCID of the tenancy to use for authentication.



[Back to overview of oci_tenant](#attributes)

### user_ocid<a name='oci_tenant_user_ocid'>

OCID of the user to use for authentication.



[Back to overview of oci_tenant](#attributes)
