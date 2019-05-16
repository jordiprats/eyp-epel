define epel::import_gpg_key (
                              $key_name = $name,
                              $path     = "/etc/pki/rpm-gpg/${name}",
                            ) {

  exec {  "GPG import ${key_name}":
    path    => '/bin:/usr/bin:/sbin:/usr/sbin',
    command => "rpm --import ${path}",
    unless  => "rpm -q gpg-pubkey-$(echo $(gpg --throw-keyids --keyid-format short < ${path}) | cut --characters=11-18 | tr '[A-Z]' '[a-z]')",
  }
}
