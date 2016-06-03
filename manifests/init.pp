class epel ($ensure='installed', $manage_ca_certificates=true) inherits epel::params {

  validate_re(
              $ensure,
              [ '^installed$', '^latest$', '^purged$' ],
              "Not a valid package status: ${ensure}"
              )

  if($manage_ca_certificates)
  {
    #yum check-update
    exec { 'update-ca':
      command => '/usr/bin/yum upgrade ca-certificates --disablerepo =epel* -y > /var/log/yum.ca-certificates.log',
      unless  => '/usr/bin/yum check-update ca-certificates',
      before  => Package['epel-release'],
    }
  }

  package { 'epel-release':
    ensure   => $ensure,
    provider => $epel::params::rpmprovider,
    source   => $epel::params::sourcerpm,
  }
}
