Rails.application.routes.draw do
  
  # Main Controller
  ## Frontpage
  root 'main#index'
  ## About
  #get 'about' => 'main#about'
  
  # Author Controller
  ## View
  #get 'a/:id' => 'author#show'
  ## Search
  #get 'a/search/:query' => 'author#search'

  # User Controller
  ## Show
  #get 'u/:id' => 'user#show'
  ## Sign Up
  get 'u/create' => 'user#create'
  post 'u/try_create' => 'user#try_create'
  ## Settings
  #get 'u/view' => 'user#index'
  ## Login
  get 'login' => 'user#login'
  post 'logout' => 'user#logout'
  post 'try_login' => 'user#try_login'
  
  # Design Controller
  ## View
  #get 'd/:id' => 'design#show'
  ## Upload
  #get 'd/create' => 'design#create'
  ## Search
  #get 'd/search/:query' => 'design#search'
  ## View All
  #get 'd/view-all' => 'design#index'
  
  #get 'login' => 'login#login'
  

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
