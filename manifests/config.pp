class epel::config inherits epel {

  if($epel::manage_gpg)
  {
    file { "/etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-${epel::params::os_maj_release}":
      ensure  => present,
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      content => file("${module_name}/RPM-GPG-KEY-EPEL-${epel::params::os_maj_release}"),
    }

    epel::import_gpg_key { 'RPM-GPG-KEY-EPEL-${epel::params::os_maj_release}':
      path    => "/etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-${epel::params::os_maj_release}",
      require => File["/etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-${epel::params::os_maj_release}"],
    }
  }

  if($epel::manage_main_repo)
  {
    case $epel::main_baseurl
    {
      'absent':
      {
        $epel__main_metalink = $epel::main_metalink
      }
      default:
      {
        $epel__main_metalink = 'absent'
      }
    }

    yumrepo { 'epel':
      enabled        => bool2number($epel::main_enabled),
      baseurl        => $epel::main_baseurl,
      metalink       => $epel__main_metalink,
      failovermethod => $epel::main_failovermethod,
      proxy          => $epel::main_proxy,
      gpgcheck       => bool2number($epel::main_gpgcheck),
      gpgkey         => $epel::main_gpgkey,
      descr          => $epel::main_description,
      exclude        => $epel::main_exclude,
      includepkgs    => $epel::main_include,
      sslclientkey   => $epel::main_sslclientkey,
      sslclientcert  => $epel::main_sslclientcert,
    }
  }

}
