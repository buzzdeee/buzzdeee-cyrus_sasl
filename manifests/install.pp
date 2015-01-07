# Private class, do not use directly.
# Takes care about package installation.

class cyrus_sasl::install (
  $package_name,
  $package_flavor,
  $package_ensure,
) {
  package { $package_name:
    ensure => $package_ensure,
    flavor => $package_flavor,
  }
}
