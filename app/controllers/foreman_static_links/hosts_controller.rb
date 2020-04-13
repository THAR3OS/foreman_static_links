module ForemanStaticLinks
  # Example: Plugin's HostsController inherits from Foreman's HostsController
  class HostsController < ::HostsController
    # change layout if needed
    # layout 'foreman_static_links/layouts/new_layout'

    def static_links
      # automatically renders view/foreman_static_links/monitor#static_links
    end
  end
end
