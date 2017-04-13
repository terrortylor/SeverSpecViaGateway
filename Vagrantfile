# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/trusty64"
  config.ssh.insert_key = false

  config.vm.provider :virtualbox do |v|
    v.memory = 1024
  end

  # Dummy gateway instance
  config.vm.define "gateway" do |app|
    app.vm.hostname = "gateway"
    app.vm.network :private_network, ip: "192.168.60.4"
  end

  # Fake fat10 instance
  # Overridden in hsotfile
  config.vm.define "server" do |app|
    app.vm.hostname = "fat10store.projectepic.net"
    app.vm.network :private_network, ip: "192.168.60.5"
  end

  # Ansible provisioning.
  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "playbook.yml"
    ansible.sudo = true
  end

end
