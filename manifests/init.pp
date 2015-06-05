# == Class: epel
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2015 Your name here, unless otherwise noted.
#
class epel () inherits epel::params {
  exec { 'update-ca':
    command => '/usr/bin/yum upgrade ca-certificates --disablerepo=epel* -y > /root/yum.ca-certificates.log',
    creates => '/root/yum.ca-certificates.log',
  }

  package { 'epel-release':
    ensure   => installed,
    provider => $epel::params::rpmprovider,
    source   => $epel::params::sourcerpm,
    require  => Exec['update-ca'],
  }
}
