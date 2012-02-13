class sudoers {
  File {
    ensure => present,
    owner  => 'root',
    group  => 'root',
    mode   => '0440',
  }
  file { '/etc/sudoers.check':
    source => 'puppet:///modules/sudoers/sudoers',
  }
  exec { "Check sudoers":
    command   => 'visudo -c -f /etc/sudoers.check',
    path      => ['/usr/bin','/usr/sbin'],
    logoutput => 'on_failure',
    unless    => 'diff /etc/sudoers /etc/sudoers.check',
    require   => File['/etc/sudoers.check'],
    before    => File['/etc/sudoers'],
  }
  file { '/etc/sudoers':
    source => '/etc/sudoers.check',
  }
}
