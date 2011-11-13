class puppet::master {
  include puppet
  include puppet::params

  iptables::resource::rule { puppet:
    port => 8140,
  }

  package { "puppetmaster":
    ensure    => latest,
    require   => File["/etc/apt/preferences.d/puppet"],
    subscribe => File["/etc/apt/preferences.d/puppet"],
  }

  service { "puppetmaster":
    ensure     => running,
    hasstatus  => true,
    hasrestart => true,
    enable     => true,
    require    => File["/etc/puppet/puppet.conf"],
  }
}
