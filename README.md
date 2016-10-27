## Usage

You'll need the current `seedian.box` vagrant box. Speak to jerith about that.

Copy the puppet repo you want to test:
```
./scripts/copy-puppet.sh /path/to/puppet/repo
```

Create the VM and log in:
```
vagrant up
vagrant ssh
```

Run your puppet tests. The first time, you'll need to install all the
third-party modules your environments need. On subsequent runs, you'll only
need to do that if something changes.
```
/vagrant/scripts/run-puppet-with-librarian.sh node-hostname.example.com --noop
/vagrant/scripts/run-puppet.sh node-hostname.example.com --environment=qa
```

The first parameter to the `run-puppet*.sh` scripts is the hostname of the node
this VM is pretending to be. All remaining parameters are passed unmodified to
the `puppet apply` command. Read `run-puppet.sh` for more details.

## Status

This works for me. Hopefully it'll work for a few other people as well. Shout
if it doesn't.
