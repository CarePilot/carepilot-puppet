class puppet::install {
  file { '/etc/apt/preferences.d/puppet':
    ensure => present,
    owner  => 'root',
    group  => 'root',
    source => "puppet:///modules/puppet/preferences.d/puppet",
  }

  package { "facter" :
    ensure  => latest,
    require   => File["/etc/apt/preferences.d/puppet"],
    subscribe => File["/etc/apt/preferences.d/puppet"],
  }

  package { "puppet" :
    ensure  => latest,
    require   => File["/etc/apt/preferences.d/puppet"],
    subscribe => File["/etc/apt/preferences.d/puppet"],
  }
}
