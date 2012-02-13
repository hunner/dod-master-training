class bluetooth::disable inherits bluetooth {
  Service['hidd'] {
    ensure => stopped,
    enable => false,
    before => Package['bluez-utils','bluez-libs'],
  }
  Package['bluez-utils'] {
    ensure  => absent,
    require => undef,
  }
  Package['bluez-libs'] {
    ensure  => absent,
    require => Package['bluez-utils'],
  }
}
