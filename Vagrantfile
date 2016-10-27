# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "seedian.box"

  if Vagrant.has_plugin?('vagrant-vbguest')
    # vagrant-vbguest is terribly slow and we don't need it.
    config.vbguest.auto_update = false
  end

  if Vagrant.has_plugin?("vagrant-cachier")
    # Configure cached packages to be shared between instances of the same base
    # box. More info on http://fgrehm.viewdocs.io/vagrant-cachier/usage
    config.cache.scope = :box
  end

  config.vm.define 'puppet-test-vm' do |machine|
    machine.vm.hostname = 'puppet-test-vm'

    machine.vm.network "private_network", ip: "192.168.77.2"
    # If we need a second network interface, here it is:
    # machine.vm.network "private_network", ip: "172.28.128.2", auto_config: false

    machine.vm.provider "virtualbox" do |vb|
      vb.memory = "2048"
      vb.cpus = 2
    end

    machine.vm.provision :shell, path: 'scripts/setup-vm.sh'
  end
end
