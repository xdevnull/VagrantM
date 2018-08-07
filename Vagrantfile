Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.network "forwarded_port", guest: 80, host: 8080
  config.vm.network "forwarded_port", guest: 25, host: 2525
  config.vm.synced_folder "./shared_data", "/home/vagrant/vagrant_data"
  config.vm.provision "shell", path: "scripts/provision.sh"
end
