# SeverSpecViaGateway

# Intro
This is a test project that spins up a few instances and then runs tests against
them, using one as a gateway server.

This creates two machines, the bastion and the target server.
In is not able to communicate to the target server directly (it can but for
testing we assume it can't).

The 'Test Runner' is this box.

The idea is that using ssh-agent forwarding we can connect to a given user on the 'Target Server' by connecting via the bastion.
```
+--------------+    +-----------+    +-----------------+
|              |    |           |    |                 |
| Test Runner  +---->  Gateway  +---->  Target Server  |
|              |    |           |    |                 |
+--------------+    +-----------+    +-----------------+
```
Viewing the Gateway's processes when running the tests suit you can see that
a connection is created for 'bastion' user.

# Prerequisite
The following are installed:
* Vagrant - 1.9.1
* ansible - 2.2.1.0
* bundle - 1.14.6
* ruby - 2.3.3p222

It also uses your local users SSH key, so assumes that you have
keys set up and 'ssh-agent' is installed.

# Setup
## Spin up VMs
```
vagrant up
```

## Serverspec and rake install
```
bundle  install --path .gems
```

## Run the tests
```
# Set up ssh-agent with key
ssh-agent
ssh-add ~/.ssh/id_rsa
# Run the tests
bundle exec rake serverspec
```

# Based on:
* https://www.relishapp.com/rspec/rspec-core/docs/example-groups/shared-examples
* http://pmyjavec.com/code/2014/12/03/serverspec-behind-jump-server.html
* http://serverspec.org/advanced_tips.html
