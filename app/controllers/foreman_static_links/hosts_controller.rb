module ForemanStaticLinks
  # Example: Plugin's HostsController inherits from Foreman's HostsController
  class HostsController < ::HostsController
    # change layout if needed
    # layout 'foreman_static_links/layouts/new_layout'

    def new_action
      # automatically renders view/foreman_static_links/hosts/new_action
    end
  end
end
