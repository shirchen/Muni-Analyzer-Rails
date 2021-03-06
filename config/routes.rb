MuniAnalyzerRails::Application.routes.draw do
  resources :gold_plateds

  resources :summaries

  resources :posts

  resources :runs

  match 'bus_runs/:id' => 'runs#display'
  match 'all_bus_ids/' => 'runs#show_all_buses'
  match 'summarize/:id' => 'summaries#show_bus_id'
  match 'chart' => 'summaries#chart'
  match '/display_bus_route/:bus_id/:start_time/:end_time' => 'runs#display_bus_route'
  match 'display_marker/:id' => 'runs#display_marker'
  match 'display_marker_bus_route/:bus_id/:start_time/:end_time' => 'runs#display_marker_bus_route'
  match '/schedule_compare/:start_time/:end_time' => 'summaries#schedule_compare'

  #get "home/index"

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
   root :to => "home#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
