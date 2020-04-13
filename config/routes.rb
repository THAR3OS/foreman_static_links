Rails.application.routes.draw do
  get 'new_action', to: 'foreman_static_links/hosts#new_action'
end
