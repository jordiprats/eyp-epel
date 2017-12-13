class epel(
            $ensure                          = 'installed',
            $manage_ca_certificates          = true,
            $enable_repo_epel                = true,
            $enable_repo_epel_debug          = false,
            $enable_repo_epel_source         = false,
            $enable_repo_epel_testing        = false,
            $enable_repo_epel_testing_debug  = false,
            $enable_repo_epel_testing_source = false,
          ) inherits epel::params {

  validate_re(
              $ensure,
              [ '^installed$', '^latest$', '^purged$' ],
              "Not a valid package status: ${ensure}"
              )

  class { '::epel::install': } ->
  class { '::epel::config': } ->
  Class['::epel']
}
