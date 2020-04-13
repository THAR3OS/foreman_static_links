Rails.application.routes.draw do
  get 'static_links', to: 'foreman_static_links/monitor#static_links'
end
