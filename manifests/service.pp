class cyrus_sasl::service (
  $service_ensure,
  $service_flags,
  $service_enable,
) {
  service { 'saslauthd':
    ensure => $service_ensure,
    enable => $service_enable,
    flags  => $service_flags,
  }
}
