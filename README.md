# Bower Mirror Module

Michael Krotscheck <krotscheck@gmail.com>

This module manages and installs a running instance of private-bower, which
will lazy-mirror the bower registry and set up local git clones of any
requested components.

Initial cache construction can be slow, as it performs a full clone of the
requested git or svn repository. This can cause package resolution to
intermittently fail when the time to clone a repository exceeds the client's
wait time.

# Quick Start

To install, simply include the class.

    node default {
        include bower
    }

# Development and testing.

A vagrantfile has been provided with which you may test this module. Simply run
`vagrant up` in the root directory of this repository.

# Use with bower client

Create a file named '.bowerrc' in the root directory of your project with the
following content. This particular configuration is set up to work with the
above mentioned vagrant vm.

  {
    "registry": {
      "search": [
        "http://192.168.99.23:5678"
      ]
    }
  }