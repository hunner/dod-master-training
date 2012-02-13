define services::service (
  $port,
  $protocols = ['tcp','udp'],
  $aliases = "",
  $comment = ""
) {
  file {"${services::basedir}/services.d/${name}":
    ensure  => present,
    content => template('services/service.erb'),
    notify  => Exec['rebuild-services'],
  }
}
