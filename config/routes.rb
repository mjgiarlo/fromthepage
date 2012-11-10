ExPageLuxLucis::Application.routes.draw do
  root :to => 'static#splash'

  #map.connect 'ZenasMatthews', :controller => 'collection', :action => 'show', :collection_id => 7
  #map.connect 'JuliaBrumfield', :controller => 'collection', :action => 'show', :collection_id => 1

  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing the them or commenting them out if you're using named routes and resources.
  match ':controller(/:action(/:id))(.:format)'
end
