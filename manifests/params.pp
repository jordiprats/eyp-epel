class epel::params
{

  if getvar('::operatingsystemmajrelease')
  {
    $os_maj_release = $::operatingsystemmajrelease
  }
  else
  {
    $os_versions    = split($::operatingsystemrelease, '[.]')
    $os_maj_release = $os_versions[0]
  }

  $main_metalink = "https://mirrors.fedoraproject.org/metalink?repo=epel-${os_maj_release}&arch=\$basearch"

  case $::osfamily
  {
    'redhat' :
    {

      case $::operatingsystem
      {
          'Fedora': { notice ("EPEL will not be installed on ${::operatingsystem} ${::operatingsystemrelease}") }
          'Amazon': { notice ("EPEL will not be managed on ${::operatingsystem} ${::operatingsystemrelease}") }
          default:
          {
            case $::operatingsystemrelease
            {
              /^5.*$/ :
              {
                $rpmprovider = 'rpm'
                $sourcerpm = 'https://dl.fedoraproject.org/pub/epel/epel-release-latest-5.noarch.rpm'
              }
              /^6.*$/ :
              {
                $rpmprovider = 'rpm'
                $sourcerpm = 'https://dl.fedoraproject.org/pub/epel/epel-release-latest-6.noarch.rpm'
              }
              /^7.*$/ :
              {
                $rpmprovider = 'rpm'
                $sourcerpm = 'https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm'
              }
              default :
              {
                fail("Unsupported RHEL/CentOS version! - ${::operatingsystemrelease}")
              }
            }
          }
      }
    }
    default  :
    {
      notice ("${::operatingsystem} will not have the EPEL repository applied")
    }
  }
}
