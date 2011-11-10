class puppet::service {
  iptables::resource::rule { puppet:
    port => 8140,
  }
  service {"puppet":
    ensure => false,
    hasstatus => true,
    hasrestart => true,
    enable => false,
    require => Class["puppet::install"],
  }
}
