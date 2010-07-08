ActionController::Routing::Routes.draw do |map|
  map.resources :photos do |p|
    p.resources :tags
  end
  
  map.root :controller => 'photos', :action => 'index'
end
