require 'yaml'

module ForemanStaticLinks
  # Example: Plugin's HostsController inherits from Foreman's HostsController
  class HostsController < ::HostsController
    # change layout if needed
    # layout 'foreman_static_links/layouts/new_layout'

    def static_links
      begin
        @linklist = YAML.load(File.read("/etc/foreman/foreman_static_links.yaml"))
      rescue
        @linklist = [
          {
            title: 'foreman_static_links is currently unconfigured',
            description: 'please see the README.',
            url: 'https://github.com/THAR3OS/foreman_static_links/',
            target: '_new'
          },
        ]
      end
    end
  end
end
