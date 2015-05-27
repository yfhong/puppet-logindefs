# == Class logindefs::config
#
# This class is called from logindefs for service config.
#
class logindefs::config {
  validate_hash($::logindefs::options)
  $::logindefs::options.each |$key, $value| {
    file_line { $key:
      ensure => 'present',
      path   => '/etc/login.defs',
      line   => "${key}\t${value}",
      match  => "^#?${key}.*",
    }
  }
}
