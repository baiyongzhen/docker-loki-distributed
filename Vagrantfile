# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  if (/cygwin|mswin|mingw|bccwin|wince|emx/ =~ RUBY_PLATFORM) != nil
    config.vm.synced_folder ".", "/vagrant", mount_options: ["dmode=700,fmode=600"]
  else
    config.vm.synced_folder ".", "/vagrant"
  end

  config.vm.define :storage do |host|
    host.vm.box = "bento/ubuntu-18.04"
    host.vm.hostname = "storage"
    host.vm.network :private_network, ip: "192.168.56.180"
    host.vm.provision :shell, path: "scripts/debian_bootstrap.sh"
    # boot timeout
    host.vm.boot_timeout = 120

    # Set system settings
    host.vm.provider :virtualbox do |vb|
        vb.customize ["modifyvm", :id, "--memory", "3072"]
        vb.customize ["modifyvm", :id, "--cpus", "2"]
    end
  end

  NodeCount = 3
  # AWX Worker Nodes
  (1..NodeCount).each do |i|
    config.vm.define "loki#{i}" do |host|
      host.vm.box = "bento/ubuntu-18.04"
      host.vm.hostname = "loki#{i}"
      host.vm.network "private_network", ip: "192.168.56.18#{i}"
      host.vm.provision "shell", path: "scripts/debian_bootstrap.sh"
      # boot timeout
      host.vm.boot_timeout = 120
      # Set system settings
      host.vm.provider "virtualbox" do |vb|
        vb.customize ["modifyvm", :id, "--memory", "1024"]
        vb.customize ["modifyvm", :id, "--cpus", "1"]
      end
    end
  end

end