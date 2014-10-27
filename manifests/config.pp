class cyrus_sasl::config (
  $saslauthd_conf_settings,
){
  file { '/etc/saslauthd.conf':
    owner   => 'root',
    group   => '0',
    mode    => '0640',
    content => template('cyrus_sasl/saslauthd.conf.erb')
  }
}
