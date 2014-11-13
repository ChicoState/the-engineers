Rails.application.routes.draw do
  
  # Main Controller
  ## Frontpage
  root 'main#index'
  ## About
  #get 'about' => 'main#about'
  
  # Author Controller
  ## Search
  #get 'a/search/:query' => 'author#search'
  ## Show
  #get 'a/:id' => 'author#show'

  # User Controller
  ## Sign Up
  get 'u/browse' => 'user#browse'
  get 'u/create' => 'user#create'
  post 'u/try_create' => 'user#try_create'
  ## Settings
<<<<<<< HEAD
  #get 'u/view' => 'user#index'
  ## Show
  get 'u/:id' => 'user#show'
=======
  get 'u/view' => 'user#index'
  patch 'try_index' => 'user#try_index'
>>>>>>> e966eab4aa0b0e79ea70939a5bbe5fe1195c3e0b
  ## Login
  get 'login' => 'user#login'
  post 'logout' => 'user#logout'
  post 'try_login' => 'user#try_login'
  ## Show
  get 'u/:id' => 'user#show', as: 'user'
  
  # Design Controller
  ## Upload
  get 'd/create' => 'design#create'
  post 'd/try_create' => 'design#try_create'
  ## Search
  #get 'd/search/:query' => 'design#search'
  ## View All
  get 'd/view-all' => 'design#index'
  ## Show
<<<<<<< HEAD
  get 'd/:id' => 'design#show'  

=======
  get 'd/:id' => 'design#show', as: 'design'
  ## About
  get 'about' => 'design#about'
  ## Contact
  get 'contact' => 'design#contact'
  ## Legal
  get 'legal' => 'design#legal'
>>>>>>> e966eab4aa0b0e79ea70939a5bbe5fe1195c3e0b
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
