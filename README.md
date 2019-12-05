
[![Enterprise Modules](https://raw.githubusercontent.com/enterprisemodules/public_images/master/banner1.jpg)](https://www.enterprisemodules.com)

#### Table of Contents

1. [Overview](#overview)
2. [License](#license)
3. [Description - What the module does and why it is useful](#description)
4. [Setup](#setup)
  * [Requirements](#requirements)
  * [Installing the oci_config module](#installing-the-oci_config-module)
5. [Usage - Configuration options and additional functionality](#usage)
6. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
7. [Limitations - OS compatibility, etc.](#limitations)

## Overview

This module allows you to configure and manage Oracle Cloud Infrastructure components with puppet. Why would I like to use Puppet to manage Oracle Cloud Infrastructure? Isn't Terraform the solution for this?

Terraform is a great tool, and if you are using that, that is fine. There are, however, some reasons Puppet might fit better for you. 

- Your organization is already using Puppet and **not** terraform.  Introducing a new tool into your organization might be more then you want or need. In these cases, Puppet, in combination with this module, is a great help.
- You want to use existing hiera data to configure parts of your OCI infrastructure. In this case, using this module is great. It integrates with all of the existing hieradata, just like your other Puppet code.
- You need tighter integration between OCI configuration in general and the configuration management **on** your systems. Again, this module is for you. It is regular Puppet so you can use **all** of the rich puppet features like exported resources to integrate all of your configuration settings both ion the cloud level as well as on the machines.

This module is  is part of our family of Puppet modules for Oracle products. Besides the [`oci_config`](https://www.enterprisemodules.com/shop/products/puppet-oci_config-module) module, this family also contains:

- [ora_install](https://www.enterprisemodules.com/shop/products/puppet-ora_install-module) For installing an Oracle database and other database related Oracle products
- [`ora_config`](https://www.enterprisemodules.com/shop/products/puppet-ora_config-module?taxon_id=14) For configuring every aspect of your Oracle database
- [ora_cis](https://www.enterprisemodules.com/shop/products/puppet-oracle-security-module) To secure your databases according to the CIS benchmarks.
- [ora_profile](https://forge.puppet.com/enterprisemodules/ora_profile) The ora_profile module allows an easy path from first simple installation to a fully customized Enterprise setup. 
- [ovm_config](https://www.enterprisemodules.com/shop/products/puppet-oracle-vm-config) To create and manage the infrastructure componentns in Oracle VM.


## License

This is a commercially licensed module. But you can use this module for **FREE**.  [Contact us](https://www.enterprisemodules.com/company/contact/) to obtain this **FREE** license file.

## Want support? ##

If you'd like to have support on this module, we provide an annual subscription(an entitlement). When you purchase an entitlement:

- you are allowed to use the module on the named nodes you purchased the subscription for;
- you get full support on usage and any issues you have;
- we will guide you towards a working setup;
- Are allowed to use the latest and greatest version without any extra charge.

We will make sure the modules keep working with the latest versions of Oracle Cloud.

[Contact us](https://www.enterprisemodules.com/company/contact/) if you are interested in purchasing support.


You can use the module on VirtualBox based development systems for **FREE**. You can [request a **FREE** trial license here](https://www.enterprisemodules.com/sign-up-for-free-trial)

[![FREE TRIAL](https://raw.githubusercontent.com/enterprisemodules/public_images/master/free-trial.jpg)](https://www.enterprisemodules.com/sign-up-for-free-trial)

Check the [License](https://forge.puppet.com/enterprisemodules/oci_config/license) for details.

## Description

This module allows you to create and manage Oracle Cloud Infrastructure components. It is functionaly equivalent to the Terraform OCI providers. For some customers, having this code in Puppet instead of using Terraform, is a benefit. 


Check [here](https://www.enterprisemodules.com/docs/oci_config/description.html) to see the full documentation for this module.

## Setup


### Requirements

The [`oci_config`](https://www.enterprisemodules.com/shop/products/puppet-oci_config-module) module requires:

- Puppet module [`enterprisemodules-easy_type`](https://forge.puppet.com/enterprisemodules/easy_type) installed.
- Puppet version 3.0 or higher. Can be Puppet Enterprise or Puppet Open Source
- A valid OCI account
- A valid Enterprise Modules license for usage.
- Runs on most Linux systems.

### Installing the oci_config module

To install these modules, you can use a `Puppetfile`

```
mod 'enterprisemodules/oci_config'               ,'0.1.x'
```

Then use the`r10K` to install the software.

You can also install the software using the `puppet module`  command:

```
$ puppet module install enterprisemodules-oci_config
```

## Usage

To be filled in

## Reference

Here you can find some more information regarding this puppet module:

- [The `oci_config` documentation](https://www.enterprisemodules.com/docs/oci_config/description.html)

Here are a related blog posts:
- to be filled in

## Limitations

This module runs on most Linux versions. It requires a puppet version higher than 4. Other configurations are no supported.