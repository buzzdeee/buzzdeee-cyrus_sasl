# == Class: cyrus_sasl
#
# Full description of class cyrus_sasl here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { 'cyrus_sasl':
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Sebastian Reitenbach <sebastia@l00-bugdead-prods.de>
#
# === Copyright
#
# Copyright 2014 Sebastian Reitenbach, unless otherwise noted.
#
class cyrus_sasl (
  $override_saslauthd_conf_settings = $cyrus_sasl::params::saslauthd_conf_settings,
  $package_ensure = $cyrus_sasl::params::package_ensure,
  $package_name   = $cyrus_sasl::params::package_name,
  $package_flavor = $cyrus_sasl::params::package_flavor,
  $service_ensure = $cyrus_sasl::params::service_ensure,
  $service_enable = $cyrus_sasl::params::service_enable,
  $service_flags  = $cyrus_sasl::params::service_flags,
) inherits cyrus_sasl::params {

  class { 'cyrus_sasl::install':
    package_ensure => $package_ensure,
    package_flavor => $package_flavor,
    package_name   => $package_name,
  }

  $saslauthd_conf_settings = deep_merge($cyrus_sasl::params::saslauthd_conf_settings, $override_saslauthd_conf_settings)
  class { 'cyrus_sasl::config':
    saslauthd_conf_settings => $saslauthd_conf_settings,
  }

  class { 'cyrus_sasl::service':
    service_ensure => $service_ensure,
    service_enable => $service_enable,
    service_flags  => $service_flags,
  }

  Class['cyrus_sasl::install'] ->
  Class['cyrus_sasl::config']  ~>
  Class['cyrus_sasl::service']

}
