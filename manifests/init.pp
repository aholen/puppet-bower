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

class bower (
  $hostname              = $::ipaddress,
  $authentication_key    = 'changeme',
  $homedir               = '/home',
  $install_packages      = true
) {


	# Configure the entire bower instance. This does not install anything,
	# but ensures that variables are consistent across all modules.
	class { '::bower::params':
		hostname               => $hostname,
    authentication_key     => $authentication_key,
    homedir                => $homedir,
    install_packages       => $install_packages
	}

  include ::bower::user
  include ::bower::mirror
}
