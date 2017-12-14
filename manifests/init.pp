class epel(
            $ensure                          = 'installed',
            $manage_ca_certificates          = true,
          ) inherits epel::params {

  validate_re(
              $ensure,
              [ '^installed$', '^latest$', '^purged$' ],
              "Not a valid package status: ${ensure}"
              )

  class { '::epel::install': } ->
  Class['::epel']
}
