require 'yaml'
require 'foreman_static_links/engine'

module ForemanStaticLinks
  links = YAML.load(File.read("/etc/foreman/foreman_static_links.yaml"))
end
