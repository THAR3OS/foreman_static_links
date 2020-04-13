module ForemanStaticLinks
  class Engine < ::Rails::Engine
    engine_name 'foreman_static_links'

    config.autoload_paths += Dir["#{config.root}/app/controllers/concerns"]
    config.autoload_paths += Dir["#{config.root}/app/helpers/concerns"]
    config.autoload_paths += Dir["#{config.root}/app/models/concerns"]
    config.autoload_paths += Dir["#{config.root}/app/overrides"]

    # Add any db migrations
    initializer 'foreman_static_links.load_app_instance_data' do |app|
      ForemanStaticLinks::Engine.paths['db/migrate'].existent.each do |path|
        app.config.paths['db/migrate'] << path
      end
    end

    initializer 'foreman_static_links.register_plugin', :before => :finisher_hook do |_app|
      Foreman::Plugin.register :foreman_static_links do
        requires_foreman '>= 1.16'

        # Add permissions
        security_block :foreman_static_links do
          permission :view_foreman_static_links, :'foreman_static_links/hosts' => [:new_action]
        end

        # Add a new role called 'Discovery' if it doesn't exist
        role 'ForemanStaticLinks', [:view_foreman_static_links]

        # add menu entry
        menu :top_menu, :template,
             url_hash: { controller: :'foreman_static_links/hosts', action: :new_action },
             caption: 'ForemanStaticLinks',
             parent: :hosts_menu,
             after: :hosts

        # add dashboard widget
        widget 'foreman_static_links_widget', name: N_('Foreman plugin template widget'), sizex: 4, sizey: 1
      end
    end

    # Include concerns in this config.to_prepare block
    config.to_prepare do
      begin
        Host::Managed.send(:include, ForemanStaticLinks::HostExtensions)
        HostsHelper.send(:include, ForemanStaticLinks::HostsHelperExtensions)
      rescue => e
        Rails.logger.warn "ForemanStaticLinks: skipping engine hook (#{e})"
      end
    end

    rake_tasks do
      Rake::Task['db:seed'].enhance do
        ForemanStaticLinks::Engine.load_seed
      end
    end

    initializer 'foreman_static_links.register_gettext', after: :load_config_initializers do |_app|
      locale_dir = File.join(File.expand_path('../../..', __FILE__), 'locale')
      locale_domain = 'foreman_static_links'
      Foreman::Gettext::Support.add_text_domain locale_domain, locale_dir
    end
  end
end
