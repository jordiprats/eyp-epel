# epel

#### Table of Contents

1. [Overview](#overview)
2. [Module Description](#module-description)
3. [Setup](#setup)
    * [What epel affects](#what-epel-affects)
    * [Beginning with epel](#beginning-with-epel)
4. [Usage](#usage)
5. [Reference](#reference)

## Overview

Enables EPEL repository

## Module Description

This module enables the EPEL repository for RH 5/6/7 and derivatives. It will
also update ca-certificates on the first run

## Setup

### What epel affects

* Installs a package called epel-release
* Updates ca-certificates
* Manages main epel repo

### Beginning with epel

Just include epel class to have it configured with the defaults:

```puppet
class { 'epel': }
```

##  Usage

### Install epel

```puppet
class { 'epel':
}
```

### Disable EPEL

```puppet
class { 'epel':
  main_enabled => false,
}
```

### Force especific mirror for EPEL

Use **main_baseurl** option to force a specific mirror:

```puppet
class { 'epel':
  main_baseurl => "https://dl.fedoraproject.org/pub/epel/7/\$basearch",
}
```

Generated yum repo will look like this:

```
[epel]

name=Extra Packages for Enterprise Linux 7 - $basearch
baseurl=https://dl.fedoraproject.org/pub/epel/7/$basearch
failovermethod=priority
enabled=1
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-7
```

## Reference

### epel


* **ensure**: Used to manage the **epel-release** package (default: installed)
* **manage_ca_certificates**: update ca-certificates (needed to install EPEL) (default: true)
* **manage_gpg**: Flag to enable/disable managing GPG keys (default: true)
* **manage_main_repo**: Whether to manage the main epel repo (default: true)
* **main_enabled**: Whether to have the main epel repo enabled or not (default: true)
* **main_baseurl**: Base URL for a specific mirror (default: not set)
* **main_metalink**: Where to get mirror list from (default: from **mirrors.fedoraproject.org**)
* **main_failovermethod**: Failover method (default: priority)
* **main_proxy**: Proxy usage (default: not set)
* **main_gpgcheck**: Whether to check GPG (default: true)
* **main_gpgkey**: Location of GPG keys (default: file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-${epel::params::os_maj_release})
* **main_description**: Main EPEL repo description (default: "Extra Packages for Enterprise Linux ${epel::params::os_maj_release} - \$basearch")
* **main_exclude**: Package exclude list (default: undef)
* **main_include**: Package include list (default: undef)
* **main_sslclientkey**: SSL client key (default: undef)
* **main_sslclientcert**: SSL client cert (default: undef)
