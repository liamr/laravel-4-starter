class php {

  package { 'php5':
    ensure => 'present',
  }

  package { 'php5-gd':
    ensure => 'present',
  }

  package { 'php5-mcrypt':
    ensure => 'present',
  }

  package { 'php5-mysql':
    ensure => 'present',
  }

  package { 'php-pear':
    ensure => 'present',
  }

  package { 'php5-sqlite':
    ensure => 'present',
  }

  package { 'php5-xdebug':
    ensure => 'present',
  }

  package { 'libapache2-mod-php5':
    ensure  => 'present',
    require => Package['apache2'],
  }


  # Upgrade PEAR, install PHPUnit.
  exec { 'pear-upgrade':
    require => Package['php-pear'],
    command => '/usr/bin/pear upgrade',

    # TRICKY:
    # PEAR returns null if there is nothing to upgrade, which Puppet
    # misinterprets as an error. We set the possible return values.
    #
    # @see http://blog.code4hire.com/2013/01/pear-packages-installation-under-vagrant-with-puppet/
    returns => [0, '', ' '],
  }

  exec { 'pear-autodiscover':
    require => Exec['pear-upgrade'],
    command => '/usr/bin/pear config-set auto_discover 1',
  }

  exec { 'pear-update-channels':
    require => Exec['pear-autodiscover'],
    command => '/usr/bin/pear update-channels',
  }

  exec { 'install-phpunit':
    require => Exec['pear-update-channels'],
    command => '/usr/bin/pear install pear.phpunit.de/PHPUnit',

    # Very important. Prevents an error if PHPUnit is already installed.
    creates => '/usr/bin/phpunit',
  }

}
