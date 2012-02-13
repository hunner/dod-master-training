usermanagement::user { 'hunner':
  homedir => '/home/hunner',
}
usermanagement::user { 'elvis':
  homedir => '/elvis',
  group   => 'foousers',
}
usermanagement::user { 'batesn':
  group => 'foousers',
}
