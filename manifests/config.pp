# Private class, do not use directly.
# Takes care about the configuration file.
class cyrus_sasl::config (
  $saslauthd_conf_settings,
  $sasl_auth_dir,
){

  file { $sasl_auth_dir:
    ensure => 'directory',
    owner  => 'root',
    group  => '0',
    mode   => '0755',
  }

  file { '/etc/saslauthd.conf':
    owner   => 'root',
    group   => '0',
    mode    => '0640',
    content => template('cyrus_sasl/saslauthd.conf.erb')
  }
}
