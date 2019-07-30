class epel::install inherits epel {

  #TODO: eliminar exec update-ca duplicat
  if($epel::manage_ca_certificates)
  {
    if versioncmp($::puppetversion, '3.8.0') < 0
    {
      # yum check-update
      exec { 'update-ca':
        command => '/usr/bin/yum upgrade ca-certificates --disablerepo =epel* -y',
        unless  => '/usr/bin/yum check-update ca-certificates',
        before  => Package['epel-release'],
      }
    }
    else
    {
      schedule { 'eyp-epel daily yum check-update':
        period => 'daily',
        repeat => 1,
      }

      exec { 'update-ca':
        command  => '/usr/bin/yum upgrade ca-certificates --disablerepo =epel* -y',
        unless   => '/usr/bin/yum check-update ca-certificates',
        before   => Package['epel-release'],
        schedule => 'eyp-epel daily yum check-update',
      }
    }
  }

  package { 'epel-release':
    ensure   => $epel::ensure,
    provider => $epel::params::rpmprovider,
    source   => $epel::params::sourcerpm,
  }
}
