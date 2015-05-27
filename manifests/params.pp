# == Class logindefs::params
#
# This class is meant to be called from logindefs.
# It sets variables according to platform.
#
class logindefs::params {
  case $::operatingsystem {
    'Debian', 'Ubuntu',
    'RedHat', 'CentOS',
    'Amazon': {
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
