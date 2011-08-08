class puppet::master {
  include puppet
  include puppet::params

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
