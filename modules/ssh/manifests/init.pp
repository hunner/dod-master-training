class ssh {
  package { 'openssh-server':
    ensure => present,
  }
  file { '/etc/ssh/sshd_config':
    ensure  => present,
# Looks for /etc/puppetlabs/puppet/modules/ssh/files/sshd_config
    source  => 'puppet:///modules/ssh/sshd_config',
    require => Package['openssh-server'],
    notify  => Service['sshd'],
  }
  service { 'sshd':
    ensure => running,
    enable => true,
  }
}
