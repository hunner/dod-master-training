File {
  owner => 'root',
}
file { '/tmp/base_local':
  ensure  => directory,
  recurse => true,
  source  => '/etc/puppetlabs/puppet/files/base_local',
}
file { '/tmp/base_local/repomd.xml':
  owner  => 'elvis',
  source => '/etc/puppetlabs/puppet/files/base_local/repomd.xml',
}
