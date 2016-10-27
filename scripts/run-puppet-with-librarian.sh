#!/bin/bash

pushd /vagrant/puppet/puppet/ > /dev/null
for envdir in $(find . -mindepth 1 -maxdepth 1 -type d); do
    echo "Installing modules for environment ${envdir} ..."
    pushd $envdir > /dev/null
    librarian-puppet install --verbose
    popd > /dev/null
    echo "Installed modules for environment ${envdir}"
done
popd > /dev/null

/vagrant/scripts/run-puppet.sh "$@"
