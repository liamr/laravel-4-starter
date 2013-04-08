class mysql {
  $db_name       = 'devdb'
  $root_password = 'root'

  package { 'mysql-server':
    ensure => 'installed',
  }

  package { 'mysql-client':
    ensure => 'installed',
  }

  service { 'mysql':
    ensure  => 'running',
    enable  => true,
    require => Package['mysql-server'],
  }

  # Set the root password.
  exec { 'mysql-set-root':
    unless  => "/usr/bin/mysqladmin -uroot -p$root_password status",
    command => "/usr/bin/mysqladmin -uroot password $root_password",
    require => Service['mysql'],
  }

  # Create a database for local development.
  exec { 'mysql-create-db':
    unless  => "/usr/bin/mysql -uroot -p${$root_password} ${db_name}",
    command => "/usr/bin/mysql -uroot -p${root_password} -e \"CREATE DATABASE ${db_name}; GRANT ALL ON *.* TO 'root'@'%' IDENTIFIED BY '${root_password}' WITH GRANT OPTION; FLUSH PRIVILEGES;\"",
    require => Exec['mysql-set-root'],
  }

  # Override default MySQL settings.
  file { '/etc/mysql/conf.d/vagrant.cnf':
    owner   => 'mysql',
    group   => 'mysql',
    source  => '/vagrant/puppet/modules/mysql/files/vagrant.cnf',
    notify  => Service['mysql'],
    require => Package['mysql-server'],
  }
}
