# == Class: logindefs
#
# Full description of class logindefs here.
#
# === Parameters
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#
class logindefs (
  $options,
) inherits ::logindefs::params {

  # validate parameters here

  class { '::logindefs::config': } ~>
  Class['::logindefs']
}
