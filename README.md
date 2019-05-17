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
* Managed main epel repo

### Beginning with epel

```puppet
class { 'epel': }
```

#### Force especific mirror for EPEL

```puppet
class { 'epel':
  main_baseurl => "https://dl.fedoraproject.org/pub/epel/7/\$basearch",
}
```

```
[epel]

name=Extra Packages for Enterprise Linux 7 - $basearch
baseurl=https://dl.fedoraproject.org/pub/epel/7/$basearch
failovermethod=priority
enabled=1
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-7
```

##  Usage

### Install epel

```puppet
class { 'epel':
}
```

### Disable EPEL

```
class { 'epel':
  main_enabled => false,
}
```

## Reference

### epel


* **ensure**: Used to manage the **epel-release** package (default: installed)
* **manage_ca_certificates**: update ca-certificates (needed to install EPEL) (default: true)
* **manage_main_repo**:       = true,
* **manage_gpg**:             = true,
* **main_enabled**:           = true,
* **main_baseurl**:           = 'absent',
* **main_mirrorlist**:        = $epel::params::main_mirrorlist,
* **main_failovermethod**:    = 'priority',
* **main_proxy**:             = 'absent',
* **main_gpgcheck**:          = true,
* **main_gpgkey**:            = "file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-${epel::params::os_maj_release}",
* **main_description**:       = "Extra Packages for Enterprise Linux ${epel::params::os_maj_release} - \$basearch",
* **main_exclude**:           = undef,
* **main_include**:           = undef,
* **main_sslclientkey**:      = undef,
* **main_sslclientcert**:     = undef,
