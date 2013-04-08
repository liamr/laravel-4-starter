class composer {

  exec { 'install-composer':
    require => Package['curl'],
    command => '/usr/bin/curl -sS https://getcomposer.org/installer | php && sudo mv composer.phar /usr/local/bin/composer',
  }

}
