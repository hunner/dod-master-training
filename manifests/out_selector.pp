$content = $::operatingsystem ? {
  'debian'  => 'Old skool',
  'rhel'    => 'Pay us for our red hats',
  'centos'  => 'No cost, no support',
  'solaris' => 'Enterprise!(r)',
  default   => "Unknown OS: ${::operatingsystem}",
}

file { '/tmp/os':
  ensure  => present,
  content => "OS Tagline: ${content}\n",
}
