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
  get 'u/view' => 'user#index'
  patch 'try_index' => 'user#try_index'
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
  get 'd/search' => 'design#search', as: 'search'
  ## View All
  get 'd/view-all' => 'design#index'
  ## Show
  get 'd/:id' => 'design#show', as: 'design'
  ## About
  get 'about' => 'design#about'
  ## Contact
  get 'contact' => 'design#contact'
  ## Legal
  get 'legal' => 'design#legal'
end
