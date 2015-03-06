node 'puppet-bower-trusty64' {
  class { 'bower':
    hostname => '192.168.99.23'
  }
}