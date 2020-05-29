---
title: oci core app catalog subscription
keywords: documentation
layout: documentation
sidebar: oci_config_sidebar
toc: false
---
## Overview

a subscription for a listing resource version.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).

## Attributes



Attribute Name                                                                                    | Short Description                                                                            |
------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------- |
[absent_states](#oci_core_app_catalog_subscription_absent_states)                                 | The OCI states, puppet will detect as the resource being absent.                             |
[app_catalog_subscription_name](#oci_core_app_catalog_subscription_app_catalog_subscription_name) | The name of the app_catalog_subscription.                                                    |
[compartment](#oci_core_app_catalog_subscription_compartment)                                     | The Puppet name of the resource identified by `compartment_id`.                              |
[compartment_id](#oci_core_app_catalog_subscription_compartment_id)                               | The OCID of the compartment that contains the object.                                        |
[disable_corrective_change](#oci_core_app_catalog_subscription_disable_corrective_change)         | Disable the modification of a resource when Puppet decides it is a corrective change.        |
[disable_corrective_ensure](#oci_core_app_catalog_subscription_disable_corrective_ensure)         | Disable the creation or removal of a resource when Puppet decides is a corrective change.    |
[ensure](#oci_core_app_catalog_subscription_ensure)                                               | The basic property that the resource should be in.                                           |
[eula_link](#oci_core_app_catalog_subscription_eula_link)                                         | EULA link
                                                                                   |
[id](#oci_core_app_catalog_subscription_id)                                                       | The OCID of the resource.                                                                    |
[listing](#oci_core_app_catalog_subscription_listing)                                             | The Puppet name of the resource identified by `listing_id`.                                  |
[listing_id](#oci_core_app_catalog_subscription_listing_id)                                       | The OCID of the listing.                                                                     |
[listing_resource](#oci_core_app_catalog_subscription_listing_resource)                           | The Puppet name of the resource identified by `listing_resource_id`.                         |
[listing_resource_id](#oci_core_app_catalog_subscription_listing_resource_id)                     | Listing resource id.                                                                         |
[listing_resource_version](#oci_core_app_catalog_subscription_listing_resource_version)           | Listing resource version.                                                                    |
[name](#oci_core_app_catalog_subscription_name)                                                   | The full name of the object.                                                                 |
[oci_timeout](#oci_core_app_catalog_subscription_oci_timeout)                                     | The maximum time to wait for the OCI resource to be in the ready state.                      |
[oci_wait_interval](#oci_core_app_catalog_subscription_oci_wait_interval)                         | The interval beween calls to OCI to check if a resource is in the ready state.               |
[oracle_terms_of_use_link](#oci_core_app_catalog_subscription_oracle_terms_of_use_link)           | Oracle TOU link
                                                                             |
[present_states](#oci_core_app_catalog_subscription_present_states)                               | The OCI states, puppet will detect as the resource being present.                            |
[provider](#oci_core_app_catalog_subscription_provider)                                           | resource.                                                                                    |
[publisher_name](#oci_core_app_catalog_subscription_publisher_name)                               | Name of the publisher who published this listing.                                            |
[signature](#oci_core_app_catalog_subscription_signature)                                         | A generated signature for this listing resource version retrieved the agreements API.        |
[summary](#oci_core_app_catalog_subscription_summary)                                             | The short summary to the listing.                                                            |
[synchronized](#oci_core_app_catalog_subscription_synchronized)                                   | Specifies if Puppet waits for OCI actions to be ready before moving on to an other resource. |
[tenant](#oci_core_app_catalog_subscription_tenant)                                               | The tenant for this resource.                                                                |
[time_created](#oci_core_app_catalog_subscription_time_created)                                   |   Date and time at which the subscription was created, in RFC3339 format.                    |
[time_retrieved](#oci_core_app_catalog_subscription_time_retrieved)                               |   Date and time the agreements were retrieved, in RFC3339 format.                            |




### absent_states<a name='oci_core_app_catalog_subscription_absent_states'>

The OCI states, puppet will detect as the resource being absent.



[Back to overview of oci_core_app_catalog_subscription](#attributes)

### app_catalog_subscription_name<a name='oci_core_app_catalog_subscription_app_catalog_subscription_name'>

The name of the app_catalog_subscription.



[Back to overview of oci_core_app_catalog_subscription](#attributes)

### compartment<a name='oci_core_app_catalog_subscription_compartment'>

The Puppet name of the resource identified by `compartment_id`.

See the documentation of compartment_id for all details.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_app_catalog_subscription](#attributes)

### compartment_id<a name='oci_core_app_catalog_subscription_compartment_id'>

The OCID of the compartment that contains the object.

Rather use the property `compartment` instead of a direct OCID reference.

This documentation is generated from the Ruby OCI SDK.



[Back to overview of oci_core_app_catalog_subscription](#attributes)

### disable_corrective_change<a name='oci_core_app_catalog_subscription_disable_corrective_change'>

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



[Back to overview of oci_core_app_catalog_subscription](#attributes)

### disable_corrective_ensure<a name='oci_core_app_catalog_subscription_disable_corrective_ensure'>

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



[Back to overview of oci_core_app_catalog_subscription](#attributes)

### ensure<a name='oci_core_app_catalog_subscription_ensure'>

The basic property that the resource should be in.

Valid values are `present`, `absent`. 

[Back to overview of oci_core_app_catalog_subscription](#attributes)

### eula_link<a name='oci_core_app_catalog_subscription_eula_link'>

EULA link

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_app_catalog_subscription](#attributes)

### id<a name='oci_core_app_catalog_subscription_id'>

The OCID of the resource. This is a read-only property.

This documentation is generated from the Ruby OCI SDK.



[Back to overview of oci_core_app_catalog_subscription](#attributes)

### listing<a name='oci_core_app_catalog_subscription_listing'>

The Puppet name of the resource identified by `listing_id`.

See the documentation of listing_id for all details.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_app_catalog_subscription](#attributes)

### listing_id<a name='oci_core_app_catalog_subscription_listing_id'>

The OCID of the listing.
Rather use the property `listing` instead of a direct OCID reference.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_app_catalog_subscription](#attributes)

### listing_resource<a name='oci_core_app_catalog_subscription_listing_resource'>

The Puppet name of the resource identified by `listing_resource_id`.

See the documentation of listing_resource_id for all details.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_app_catalog_subscription](#attributes)

### listing_resource_id<a name='oci_core_app_catalog_subscription_listing_resource_id'>

Listing resource id.
Rather use the property `listing_resource` instead of a direct OCID reference.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_app_catalog_subscription](#attributes)

### listing_resource_version<a name='oci_core_app_catalog_subscription_listing_resource_version'>

Listing resource version.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_app_catalog_subscription](#attributes)

### name<a name='oci_core_app_catalog_subscription_name'>

The full name of the object.



[Back to overview of oci_core_app_catalog_subscription](#attributes)

### oci_timeout<a name='oci_core_app_catalog_subscription_oci_timeout'>

The maximum time to wait for the OCI resource to be in the ready state.



[Back to overview of oci_core_app_catalog_subscription](#attributes)

### oci_wait_interval<a name='oci_core_app_catalog_subscription_oci_wait_interval'>

The interval beween calls to OCI to check if a resource is in the ready state.



[Back to overview of oci_core_app_catalog_subscription](#attributes)

### oracle_terms_of_use_link<a name='oci_core_app_catalog_subscription_oracle_terms_of_use_link'>

Oracle TOU link

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_app_catalog_subscription](#attributes)

### present_states<a name='oci_core_app_catalog_subscription_present_states'>

The OCI states, puppet will detect as the resource being present.



[Back to overview of oci_core_app_catalog_subscription](#attributes)

### provider<a name='oci_core_app_catalog_subscription_provider'>

The specific backend to use for this `oci_core_app_catalog_subscription`
resource. You will seldom need to specify this --- Puppet will usually
discover the appropriate provider for your platform.Available providers are:

sdk
: This provider uses the [Oracle Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk) to do its work.



[Back to overview of oci_core_app_catalog_subscription](#attributes)

### publisher_name<a name='oci_core_app_catalog_subscription_publisher_name'>

Name of the publisher who published this listing.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_app_catalog_subscription](#attributes)

### signature<a name='oci_core_app_catalog_subscription_signature'>

A generated signature for this listing resource version retrieved the agreements API.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_app_catalog_subscription](#attributes)

### summary<a name='oci_core_app_catalog_subscription_summary'>

The short summary to the listing.

This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_app_catalog_subscription](#attributes)

### synchronized<a name='oci_core_app_catalog_subscription_synchronized'>

Specifies if Puppet waits for OCI actions to be ready before moving on to an other resource.



[Back to overview of oci_core_app_catalog_subscription](#attributes)

### tenant<a name='oci_core_app_catalog_subscription_tenant'>

The tenant for this resource.



[Back to overview of oci_core_app_catalog_subscription](#attributes)

### time_created<a name='oci_core_app_catalog_subscription_time_created'>

  Date and time at which the subscription was created, in RFC3339 format.
Example: `2018-03-20T12:32:53.532Z`

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_app_catalog_subscription](#attributes)

### time_retrieved<a name='oci_core_app_catalog_subscription_time_retrieved'>

  Date and time the agreements were retrieved, in RFC3339 format.
Example: `2018-03-20T12:32:53.532Z`

  This documentation is generated from the [Ruby OCI SDK](https://github.com/oracle/oci-ruby-sdk).



[Back to overview of oci_core_app_catalog_subscription](#attributes)
