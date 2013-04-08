# @todo Make this OS-agnostic.
class apache-server {

  package { 'apache2':
    ensure => 'present',
  }

  service { 'apache2':
    ensure    => 'running',
    enable    => true,
    require   => Package['apache2'],
    subscribe => [
      File['/etc/apache2/mods-enabled/rewrite.load'],
      File['/etc/apache2/sites-available/default'],
    ],
  }

  file { '/etc/apache2/mods-enabled/rewrite.load':
    ensure  => 'link',
    target  => '/etc/apache2/mods-available/rewrite.load',
    require => Package['apache2'],
  }

  file { '/etc/apache2/sites-available/default':
    ensure  => 'present',
    owner   => 'root',
    group   => 'root',
    source  => '/vagrant/puppet/modules/apache-server/files/virtual-host',
    require => Package['apache2'],
  }
}
