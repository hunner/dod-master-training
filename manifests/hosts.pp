resources { 'host':
  purge => true,
}
host { 'localhost.localdomain':
  ensure       => 'present',
  host_aliases => ['localhost', 'puppet.localdomain', 'puppet', 'training', 'training.puppetlabs.lan'],
  ip           => '127.0.0.1',
  target       => '/etc/hosts',
}
host { 'localhost6.localdomain6':
  ensure       => 'present',
  host_aliases => ['localhost6'],
  ip           => '::1',
  target       => '/etc/hosts',
}
host { 'facebook.com':
  ip     => '127.0.0.1',
  ensure => present,
}
