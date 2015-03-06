#!/bin/sh

# Install Puppet!
if [ ! -f /etc/apt/sources.list.d/puppetlabs.list ]; then
  lsbdistcodename=`lsb_release -c -s`
  wget https://apt.puppetlabs.com/puppetlabs-release-${lsbdistcodename}.deb
  sudo dpkg -i puppetlabs-release-${lsbdistcodename}.deb
  sudo apt-get update
  sudo apt-get dist-upgrade -y
fi

if [ ! -d /etc/puppet/modules/nodejs ]; then
  puppet module install puppetlabs-nodejs --version 0.7.1 --force
fi
if [ ! -d /etc/puppet/modules/apache ]; then
  puppet module install puppetlabs-apache --version 0.0.4
fi
if [ ! -d /etc/puppet/modules/bower ]; then
  sudo ln -s /vagrant /etc/puppet/modules/bower
fi