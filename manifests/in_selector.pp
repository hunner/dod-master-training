file { '/tmp/os':
  ensure  => present,
  content => $::operatingsystem ? {
    'debian'  => "Old skool\n",
    'rhel'    => "Pay us for our red hats\n",
    'centos'  => "No cost, no support\n",
    'solaris' => "Enterprise!(r)\n",
    default   => "Unknown OS: ${::operatingsystem}\n",
  },
}
