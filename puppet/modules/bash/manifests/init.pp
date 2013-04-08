class bash {
  file { '/home/vagrant/.profile':
    ensure  => 'present',
    owner   => 'vagrant',
    group   => 'vagrant',
    source  => '/vagrant/puppet/modules/bash/files/profile',
  }
}
