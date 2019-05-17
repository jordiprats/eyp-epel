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

  if($epel::manage_epel_repo)
  {
    $epel__main_mirrorlist = $epel::main_baseurl ? {
      'absent' => $epel::main_mirrorlist,
      default  => 'absent',
    }

    yumrepo { 'epel':
      enabled        => $epel::main_enabled,
      baseurl        => $epel::main_baseurl,
      mirrorlist     => $epel__main_mirrorlist,
      failovermethod => $epel::main_failovermethod,
      proxy          => $epel::main_proxy,
      gpgcheck       => $epel::main_gpgcheck,
      gpgkey         => $epel::main_gpgkey,
      descr          => $epel::main_description,
      exclude        => $epel::main_exclude,
      includepkgs    => $epel::main_include,
      sslclientkey   => $epel::main_sslclientkey,
      sslclientcert  => $epel::main_sslclientcert,
    }
  }

}
