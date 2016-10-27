#!/bin/bash

NODENAME=${1:?Please provide a node name.}; shift

sudo rm -rf /etc/puppetlabs/code/environments
sudo ln -s /vagrant/puppet/puppet /etc/puppetlabs/code/environments
sudo cp /vagrant/puppet/puppet/hiera.yaml /etc/puppetlabs/code/hiera.yaml

sudo /opt/puppetlabs/bin/puppet apply --test --certname=${NODENAME} "$@" -e ''
