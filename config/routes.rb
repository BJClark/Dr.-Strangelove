ActionController::Routing::Routes.draw do |map|
  map.resources :photos do |p|
    p.resources :tags, :only => [:new, :create, :destroy]
  end
  map.resources :tags, :only => [:show]
  
  map.root :controller => 'photos', :action => 'index'
end
