class puppet::service {
  service {"puppet":
    ensure => false,
    hasstatus => true,
    hasrestart => true,
    enable => false,
    require => Class["puppet::install"],
  }
}
