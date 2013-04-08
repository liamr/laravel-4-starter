# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure('2') do |config|
  # ----------------------------------------------------------------------------
  # Basics
  # ----------------------------------------------------------------------------
  config.vm.box     = 'precise32'
  config.vm.box_url = 'http://files.vagrantup.com/precise32.box'

  # ----------------------------------------------------------------------------
  # Networking
  # ----------------------------------------------------------------------------
  config.vm.network :private_network, ip: '10.10.10.10'
  config.vm.network :forwarded_port, guest: 80, host: 8888
  config.vm.network :forwarded_port, guest: 3306, host: 8889

  # ----------------------------------------------------------------------------
  # Provisioning
  # ----------------------------------------------------------------------------
  # UTC ALL THE THINGS!
  # @see http://www.xormedia.com/utc-is-the-only-real-timezone/
  config.vm.provision :shell, :inline => 'echo "Etc/UTC" | sudo tee /etc/timezone && dpkg-reconfigure --frontend noninteractive tzdata'

  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = 'puppet/manifests'
    puppet.manifest_file  = 'base.pp'
    puppet.module_path    = 'puppet/modules'
  end

  # ----------------------------------------------------------------------------
  # VirtualBox Configuration
  # ----------------------------------------------------------------------------
  config.vm.provider :virtualbox do |vb|
    # Use UTC.
    # @see http://www.virtualbox.org/manual/ch03.html#settings-motherboard
    vb.customize ['modifyvm', :id, '--rtcuseutc', 'on']
  end
end
