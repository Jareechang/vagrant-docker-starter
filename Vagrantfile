# -*- mode: ruby -*-
# # vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

require './packages.rb'
include PackagesInstallations

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
    config.vm.box = "ubuntu/trusty64"

    config.vm.synced_folder ".", "/vagrant", disabled: true

    config.vm.provision :shell, :path => 'bootstrap.sh', 
        :args => [INSTALL_PYTHON, INSTALL_POSTGRESQL, INSTALL_DOCKER, INSTALL_DOCKER_COMPOSE]

    # skip updates
    config.vm.box_check_update = false

    # config for ssh 
    config.ssh.private_key_path = "~/.ssh/id_rsa"
    config.ssh.forward_agent = true

    # Open port on vagrant for development
    config.vm.network :forwarded_port, guest: 80, host: 8888

    config.vm.network :forwarded_port, guest: 5555, host: 4444
    config.vm.network :forwarded_port, guest: 3333, host: 1234

    config.vm.provision "file", source: "~/dotfiles/.vim/", destination: ".vim"
    config.vm.provision "file", source: "~/dotfiles/.vimrc", destination: ".vimrc"
end
