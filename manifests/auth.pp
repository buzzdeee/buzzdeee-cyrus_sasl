# This defined type configures sasl authentications
# for given softwares

define cyrus_sasl::auth (
  $pwcheck_method,
  $mech_list,
  $ensure = 'present',
) {

  require cyrus_sasl

  validate_string($pwcheck_method)
  validate_array($mech_list)

  file { "${::cyrus_sasl::sasl_auth_dir}/${title}.conf":
    ensure  => $ensure,
    owner   => 'root',
    group   => '0',
    mode    => '0644',
    content => template('cyrus_sasl/auth.conf.erb')
  }

}
