class epel::params {
  case $::osfamily {
    'redhat' : {
      case $::operatingsystem {
          'Fedora': { notice ("EPEL will not be installed on ${::operatingsystem} ${::operatingsystemrelease}") }
          'Amazon': { notice ("EPEL will not be managed on ${::operatingsystem} ${::operatingsystemrelease}") }
          default: {
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
      }
    }
    default  : {
      notice ("${::operatingsystem} will not have the EPEL repository applied")
    }
  }
}
