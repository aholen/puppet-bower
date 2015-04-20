# Copyright (c) 2015 Hewlett-Packard Development Company, L.P.
#
# Licensed under the Apache License, Version 2.0 (the "License"); you may
# not use this file except in compliance with the License. You may obtain
# a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
# WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
# License for the specific language governing permissions and limitations
# under the License.

# == Class: bower::params
#
# Centralized configuration management for the bower mirror module.
#
class bower::params (

  $install_dir        = '/opt/bower_mirror',

  # The user under which bower will run.
  $user               = 'bower',
  $group              = 'bower',
  $homedir            = '/home',
  $server_admin       = undef,
  $url                = undef,
  $hostname           = $::ipaddress,
  $install_packages   = true,
  # Authentication key that allows registration of private modules.
  $authentication_key = 'changeme',
) {
}
