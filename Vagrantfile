# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu-1204-chef"

  config.vm.network :forwarded_port, guest: 80, host: 8080

  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "384"]
  end
  config.vm.synced_folder "../scotrubyapp", "/src/travis-ci.org"

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = "./cookbooks"
    chef.add_recipe "nginx::setup"
    chef.add_recipe "nginx::users"
    chef.add_recipe "nginx::deploy"
  #   chef.json = { :mysql_password => "foo" }
  end
end
