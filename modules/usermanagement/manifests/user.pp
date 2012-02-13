define usermanagement::user(
  $homedir = undef,
  $group = undef
) {
  # Did they pass in a group?
  if ! $group {
    $group_real = $name
  } else {
    $group_real = $group
  }
  # Did they pass in a homedir?
  if ! $homedir {
    $homedir_real = "/home/$name"
  } else {
    $homedir_real = $homedir
  }
  File {
    owner => $name,
    group => $group_real,
    mode  => '0644',
  }
  user { $name:
    gid  => $group_real,
    home => $homedir_real,
  }
  file { $homedir_real:
    ensure => directory,
  }
  if ! defined(Group[$group_real]) {
    group { $group_real:
      ensure => present,
    }
  }
}
