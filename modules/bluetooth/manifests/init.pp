class bluetooth($disable=false) {
  $enable = ! $disable
  if $enable {
    Package['bluez-libs'] -> Package['bluez-utils'] -> Service['hidd']
    $ensure = 'present'
  } else {
    Package['bluez-libs'] <- Package['bluez-utils'] <- Service['hidd']
    $ensure = 'absent'
  }
  package { ['bluez-libs','bluez-utils']:
    ensure => $ensure,
  }
  service { 'hidd':
    ensure  => $enable,
    enable  => $enable,
    status  => 'source /etc/init.d/functions && status hidd',
  }
}
