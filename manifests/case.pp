case $::operatingsystem {
  'debian':  {  $content = 'Old skool' }
  'rhel':    {  $content = 'Pay us for our red hats' }
  'centos':  {  $content = 'No cost, no support' }
  'solaris': {  $content = 'Enterprise!(r)' }
  default:   {  fail("No /tmp/os for ${::operatingsystem}") }
}

file { '/tmp/os':
  ensure  => present,
  content => "OS Tagline: ${content}\n",
}
