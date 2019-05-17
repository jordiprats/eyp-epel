class epel(
            $ensure                 = 'installed',
            $manage_ca_certificates = true,
            $manage_epel_repo       = true,
            $manage_gpg             = true,
            $main_enabled           = true,
            $main_baseurl           = 'absent',
            $main_mirrorlist        = $epel::params::main_mirrorlist,
            $main_failovermethod    = 'priority',
            $main_proxy             = 'absent',
            $main_gpgcheck          = true,
            $main_gpgkey            = "file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-${epel::params::os_maj_release}",
            $main_description       = "Extra Packages for Enterprise Linux ${epel::params::os_maj_release} - \$basearch",
            $main_exclude           = undef,
            $main_include           = undef,
            $main_sslclientkey      = undef,
            $main_sslclientcert     = undef,
          ) inherits epel::params {

  class { '::epel::install': } ->
  class { '::epel::config': } ->
  Class['::epel']
}
