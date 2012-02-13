# finger		79/tcp
# finger		79/udp
# http		80/tcp		www www-http	# WorldWideWeb HTTP
# http		80/udp		www www-http	# HyperText Transfer Protocol
# kerberos	88/tcp		kerberos5 krb5	# Kerberos v5
# kerberos	88/udp		kerberos5 krb5	# Kerberos v5
include services
services::service { 'finger':
  port      => '79',
  protocols => ['tcp','udp'],
}
services::service { 'http':
  port    => '80',
  aliases => ['www','www-http'],
  comment => "WorldWideWeb HTTP",
}
services::service { 'kerberos':
  port    => '88',
  aliases => ['kerberos5','krb5'],
  comment => 'Kerberos v5',
}
