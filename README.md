# epel

[![PRs Welcome](https://img.shields.io/badge/prs-welcome-brightgreen.svg)](http://makeapullrequest.com)

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

### Beginning with epel

```puppet
class { 'epel': }
```

## Usage

### epel

* ensure: Used to manage the epel-package:
 - installed
 - latest
 - purged
* manage_ca_certificates: update ca-certificates (needed to install EPEL) 

## Reference

* epel: Enables/disables epel-release
