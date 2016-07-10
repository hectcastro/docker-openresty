# -*- mode: ruby -*-
# vi: set ft=ruby :

$script = <<SCRIPT

set -e
set -x

# Install dependencies
apt-get update -y && apt-get install -y curl

curl -sO https://bootstrap.pypa.io/get-pip.py
python get-pip.py
rm get-pip.py

# Add SNI support to Python
pip install \
            pyopenssl \
            ndg-httpsclient \
            pyasn1

# Install Docker Compose CLI
pip install docker-compose

SCRIPT

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/trusty64"

  config.vm.provider "virtualbox" do |v|
    v.memory = 2048
  end

  config.vm.provision "docker", {}
  config.vm.provision "shell", inline: $script
end
