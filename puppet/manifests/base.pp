group { 'puppet':
  ensure => 'present',
}

if $virtual == 'virtualbox' and $fqdn == '' {
  $fqdn = 'localhost'
}

# Make sure the packages are up-to-date before beginning.
exec { 'update-packages':
  command => '/usr/bin/apt-get update',
}

# Puppet commands are not run sequentially, so we need to ensure the 'package
# update' runs before anything else.
File    { require => Exec['update-packages'] }
Package { require => Exec['update-packages'] }

include apache-server
include bash
include mysql
include php
include curl
include git
include composer
include laravel
