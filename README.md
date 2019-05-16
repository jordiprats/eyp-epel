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
#metalink=https://mirrors.fedoraproject.org/metalink?repo=epel-7&arch=$basearch
failovermethod=priority
enabled=1
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-7
```

##  Usage

```puppet
class { 'epel':
  enable_repo_epel                => false,
  enable_repo_epel_debug          => false,
  enable_repo_epel_source         => false,
  enable_repo_epel_testing        => false,
  enable_repo_epel_testing_debug  => false,
  enable_repo_epel_testing_source => false,
}
```

## Reference

### epel

* ensure: Used to manage the **epel-release** package:
 - installed
 - purged
* manage_ca_certificates: update ca-certificates (needed to install EPEL)
* enable_repo_epel: enable/disable epel repo (default: true)
* enable_repo_epel_debug: enable/disable epel debug repo (default: true)
* enable_repo_epel_source: enable/disable epel source repo (default: true)
* enable_repo_epel_testing: enable/disable epel-testing repo (default: true)
* enable_repo_epel_testing_debug: enable/disable epel-testing debug repo (default: true)
* enable_repo_epel_testing_source: enable/disable epel-testing source repo (default: true)
