ActionController::Routing::Routes.draw do |map|
  map.resources :photos do |p|
    p.resource :tag
  end
  map.resource :tag
  
  map.root :controller => 'photos', :action => 'index'
end
