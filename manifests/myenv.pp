$username = 'elvis'
$homedir = $username ? {
  'root'  => '/root',
  default => "/home/${username}",
}
$sourcepath = '/etc/puppetlabs/puppet/files'
#$sourcepath = 'puppet:///files'
File {
  owner => $username,
  group => $username,
  mode  => '0644',
}
file { "${homedir}/.vimrc":
  ensure  => present,
  source  => "${sourcepath}/vimrc",
  replace => false,
}
file { "${homedir}/.vim":
  ensure  => directory,
  recurse => true,
  replace => false,
  source  => "${sourcepath}/vimrc",
}
case $username {
  'root': {
    file { "${homedir}/.ssh/authorized_keys":
      ensure => absent,
    }
  }
  default: {
    file { "${homedir}/.ssh":
      ensure => directory,
      mode   => '0700',
    }
    file { "${homedir}/.ssh/authorized_keys":
      ensure => present,
      source => [
        "${sourcepath}/authorized_keys/${username}",
        "${sourcepath}/authorized_keys/default",
      ],
    }
  }
}
