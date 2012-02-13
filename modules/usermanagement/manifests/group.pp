define usermanagement::group {
  group { $name:
    ensure => present,
  }
}
