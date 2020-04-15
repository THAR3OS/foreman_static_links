# ForemanStaticLinks

*A Foreman Plugin that provides a widget with static links to related projects.*

## Installation

See [How_to_Install_a_Plugin](http://projects.theforeman.org/projects/foreman/wiki/How_to_Install_a_Plugin)
for how to install Foreman plugins

## Usage

*Simply add this plugin as mentioned above.*

After installation, you'll get a new 'Static Links' page (linked below Monitor/Dashboard) containing a configurable link-list.

Additionally, the same content can also be placed as 'Static Links' widget  on the dashboard.

* On RHEL, the installation is done as: *
```
gem build foreman_static_links.gemspec
# copy the resulting gem over and
# uninstall any previous existing foreman_static_links
scl enable tfm "gem install /root/foreman_static_links-RESULTINGVERSION.gem"
# make sure /usr/share/foreman/bundler.d/Gemfile.local.rb contains "gem 'foreman_static_links'"
systemctl restart httpd
```

## Motivation

The main motivation for writing this plugin was learning how to write ruby utilizing the foreman rails infrastructure.
Having a link list is also convenient in our infrastructure to get quick links to puppetboard, git, monitoring, ...

## Configuration

* Add a file /etc/foreman/foreman_static_links.yaml with following structure:
```
---
links:
  topic1:
    url: 'https://one.target.link/you/want'
    description: 'some description that will show as mouse-over'
    title: 'The visible Link Text'
    target: '_blank'
  topic2:
    url: 'https://some.other.link/you/also/want'
    description: 'important note'
    title: 'Another important link'
    target: '_blank'
```

In tech-speak: The 'links'-hash contains an nested where each iteration contains the hash-keys url, description, title and target.

## TODO

*Add more stability on wrong configuration.*

## Contributing

Fork and send a Pull Request. Thanks!

## Copyright

Copyright (c) *2020* *Stephan Seitz*

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.

