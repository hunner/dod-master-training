class bluetooth::disable2 {
  service { 'hidd':
    ensure => stopped,
    enable => false,
    status => 'source /etc/init.d/functions && status hidd',
    before => Package['bluez-utils','bluez-libs'],
  }
  package { 'bluez-utils':
    ensure => absent,
    before => Package['bluez-libs'],
  }

  package { 'bluez-libs':
    ensure => absent,
  }
}
