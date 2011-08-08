class puppet::install {
  file { '/etc/apt/preferences.d/puppet':
    ensure => present,
    owner  => 'root',
    group  => 'root',
    source => "puppet:///files/preferences.d/puppet",
  }

  package { "puppet" :
    ensure  => latest,
    require   => File["/etc/apt/preferences.d/puppet"],
    subscribe => File["/etc/apt/preferences.d/puppet"],
  }
}
