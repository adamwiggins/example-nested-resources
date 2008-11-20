ActionController::Routing::Routes.draw do |map|
  map.resources :events, :has_many => :tickets

  map.root :controller => "events"

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
