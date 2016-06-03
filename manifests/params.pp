# == Class: epel::params
#
# === Authors
#
# Author Name <jordi.prats@gmail.com>
#
# === Copyright
#
# Copyright 2015 Jordi Prats Catala
#
class epel::params {
  case $::osfamily {
    'redhat' : {
      case $::operatingsystemrelease {
        /^5.*$/ : {
          $rpmprovider = 'rpm'
          $sourcerpm = 'https://dl.fedoraproject.org/pub/epel/epel-release-latest-5.noarch.rpm'
        }
        /^6.*$/ : {
          $rpmprovider = 'rpm'
          $sourcerpm = 'https://dl.fedoraproject.org/pub/epel/epel-release-latest-6.noarch.rpm'
        }
        /^7.*$/ : {
          $rpmprovider = 'rpm'
          $sourcerpm = 'https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm'
        }
        default : {
          fail("Unsupported RHEL/CentOS version! - ${::operatingsystemrelease}")
        }
      }

    }
    default  : {
      fail('Unsupported OS!')
    }
  }
}
