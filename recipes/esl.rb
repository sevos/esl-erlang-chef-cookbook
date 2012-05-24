# Cookbook Name:: erlang
# Recipe:: esl
# Author:: Michael S. Klishin <michael@novemberain.com>
#
# Copyright 2012, Michael S. Klishin
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#


def codename
  if (distribution = node['lsb']['codename']) == 'precise'
    'oneiric'
  else
    distribution
  end
end

apt_repository "erlangsolutions" do
  uri          "http://binaries.erlang-solutions.com/debian"
  distribution codename
  components   ["contrib"]
  key          "http://binaries.erlang-solutions.com/debian/erlang_solutions.asc"

  action :add
end

# esl-erlang fails to install without these, there is no -nox version. MK.
package "libwxbase2.8-0" do
  action :install
end
package "libwxgtk2.8-0" do
  action :install
end

package "esl-erlang" do
  action :install
end
