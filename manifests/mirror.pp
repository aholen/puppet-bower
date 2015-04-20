# Copyright (c) 2015 Hewlett-Packard Development Company, L.P.
#
# Licensed under the Apache License, Version 2.0 (the "License"); you may
# not use this file except in compliance with the License. You may obtain
# a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
# WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
# License for the specific language governing permissions and limitations
# under the License.

class bower::mirror () {
  include ::bower::params

  $install_dir = $::bower::params::install_dir
  $user = $::bower::params::user
  $group = $::bower::params::group
  $hostname = $::bower::params::hostname
  $authentication_key = $::bower::params::authentication_key
  $install_packages = $::bower::params::install_packages

  package { ['git', 'git-daemon', 'subversion']:
    ensure => present
  }

  
  nodejs::npm { "${install_dir}:private-bower":
    ensure       => present,
    require      => [File[$install_dir],User[$user]],
    notify       => File['/etc/init.d/private-bower'],
    exec_as_user => $user,
    exec_as_user_home => $install_dir,
  }



  # Install the service. Must be upstart, as sending TERM or INT causes service
  # to leave zombie git and svnserve daemons.
  file { '/etc/init.d/private-bower':
    ensure  => file,
    owner   => root,
    group   => root,
    mode    => '0755',
    content => template('bower/private-bower'),
    notify  => Service['private-bower'],
    before  => Service['private-bower'],
#    require => Package['private-bower']
  }

  # Create working directories.
  file { $install_dir:
    ensure  => directory,
    owner   => $user,
    group   => $group,
    mode    => '0755',
    before  => Service['private-bower']
  }
  file { "${install_dir}/cache_git":
    ensure  => directory,
    owner   => $user,
    group   => $group,
    mode    => '0755',
    before  => Service['private-bower']
  }
  file { "${install_dir}/cache_svn":
    ensure  => directory,
    owner   => $user,
    group   => $group,
    mode    => '0755',
    before  => Service['private-bower']
  }

  file { "${install_dir}/config.json":
    ensure  => file,
    owner   => $user,
    group   => $group,
    mode    => '0755',
    content => template('bower/config.json'),
    notify  => Service['private-bower'],
    before  => Service['private-bower'],
    require => File[$install_dir]
  }

  service { 'private-bower':
    ensure     => running
  }
}
