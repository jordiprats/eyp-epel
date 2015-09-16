# == Class: epel
#
# === Authors
#
# Author Name <jordi.prats@gmail.com>
#
# === Copyright
#
# Copyright 2015 Jordi Prats Catala
#
class epel ($ensure='installed') inherits epel::params {

  validate_re(
              $ensure,
              [ '^installed$', '^latest$', '^purged$' ],
              "Not a valid package status: ${ensure}"
              )

  exec { 'update-ca':
    command => '/usr/bin/yum upgrade ca-certificates --disablerepo=epel* -y > /var/log/yum.ca-certificates.log',
    creates => '/var/log/yum.ca-certificates.log',
  }

  package { 'epel-release':
    ensure   => $ensure,
    provider => $epel::params::rpmprovider,
    source   => $epel::params::sourcerpm,
    require  => Exec['update-ca'],
  }
}
