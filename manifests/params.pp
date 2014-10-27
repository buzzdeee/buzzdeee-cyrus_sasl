class cyrus_sasl::params {
  $saslauthd_conf_settings = {
    ldap_servers        => 'ldap://127.0.0.1/',
    ldap_bind_dn        => 'cn=Manager,dc=mydomain',
    ldap_bind_pw        => 'thepassword',
    ldap_timeout        => '10',
    ldap_time_limit     => '10',
    ldap_scope          => 'sub',
    ldap_search_base    => 'ou=People,dc=mydomain',
    ldap_auth_method    => 'bind',
    ldap_filter         => '(uid=%u)',
    ldap_verbose        => 'on',
    ldap_version        => '3',
#    ldap_tls_check_peer => 'yes',
#    ldap_tls_cacert     => '/etc/saslauthd/ca.pem',
#    ldap_tls_cert       => '/etc/saslauthd/cert.pem',
#    ldap_tls_key        => '/etc/saslauthd/cert.key',
    mech_list           => 'PLAIN',
  }
  $package_ensure = 'installed'
  $package_name   = 'cyrus-sasl'
  $package_flavor = 'ldap'
  $service_ensure = 'running'
  $service_enable = true
  $service_flags  = '-a ldap'
}
