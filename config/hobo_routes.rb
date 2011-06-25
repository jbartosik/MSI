# This is an auto-generated file: don't edit!
# You can add your own routes in the config/routes.rb file
# which will override the routes in this file.

MSI::Application.routes.draw do


  # Index action routes for controller "stopiens"
  get 'stopiens/export(.:format)', :as => 'export_stopiens'

  # Resource routes for controller "stopiens"
  get 'stopiens(.:format)' => 'stopiens#index', :as => 'stopiens'
  get 'stopiens/new(.:format)', :as => 'new_stopien'
  get 'stopiens/:id/edit(.:format)' => 'stopiens#edit', :as => 'edit_stopien'
  get 'stopiens/:id(.:format)' => 'stopiens#show', :as => 'stopien', :constraints => { :id => %r([^/.?]+) }
  post 'stopiens(.:format)' => 'stopiens#create', :as => 'create_stopien'
  put 'stopiens/:id(.:format)' => 'stopiens#update', :as => 'update_stopien', :constraints => { :id => %r([^/.?]+) }
  delete 'stopiens/:id(.:format)' => 'stopiens#destroy', :as => 'destroy_stopien', :constraints => { :id => %r([^/.?]+) }


  # Resource routes for controller "cechas"
  get 'cechas(.:format)' => 'cechas#index', :as => 'cechas'
  get 'cechas/new(.:format)', :as => 'new_cecha'
  get 'cechas/:id/edit(.:format)' => 'cechas#edit', :as => 'edit_cecha'
  get 'cechas/:id(.:format)' => 'cechas#show', :as => 'cecha', :constraints => { :id => %r([^/.?]+) }
  post 'cechas(.:format)' => 'cechas#create', :as => 'create_cecha'
  put 'cechas/:id(.:format)' => 'cechas#update', :as => 'update_cecha', :constraints => { :id => %r([^/.?]+) }
  delete 'cechas/:id(.:format)' => 'cechas#destroy', :as => 'destroy_cecha', :constraints => { :id => %r([^/.?]+) }


  # Lifecycle routes for controller "users"
  post 'users/signup(.:format)' => 'users#do_signup', :as => 'do_user_signup'
  get 'users/signup(.:format)' => 'users#signup', :as => 'user_signup'
  put 'users/:id/reset_password(.:format)' => 'users#do_reset_password', :as => 'do_user_reset_password'
  get 'users/:id/reset_password(.:format)' => 'users#reset_password', :as => 'user_reset_password'

  # Resource routes for controller "users"
  get 'users/:id/edit(.:format)' => 'users#edit', :as => 'edit_user'
  get 'users/:id(.:format)' => 'users#show', :as => 'user', :constraints => { :id => %r([^/.?]+) }
  post 'users(.:format)' => 'users#create', :as => 'create_user'
  put 'users/:id(.:format)' => 'users#update', :as => 'update_user', :constraints => { :id => %r([^/.?]+) }
  delete 'users/:id(.:format)' => 'users#destroy', :as => 'destroy_user', :constraints => { :id => %r([^/.?]+) }

  # Show action routes for controller "users"
  get 'users/:id/account(.:format)' => 'users#account', :as => 'user_account'

  # User routes for controller "users"
  match 'login(.:format)' => 'users#login', :as => 'user_login'
  get 'logout(.:format)' => 'users#logout', :as => 'user_logout'
  match 'forgot_password(.:format)' => 'users#forgot_password', :as => 'user_forgot_password'


  # Resource routes for controller "rasas"
  get 'rasas(.:format)' => 'rasas#index', :as => 'rasas'
  get 'rasas/new(.:format)', :as => 'new_rasa'
  get 'rasas/:id/edit(.:format)' => 'rasas#edit', :as => 'edit_rasa'
  get 'rasas/:id(.:format)' => 'rasas#show', :as => 'rasa', :constraints => { :id => %r([^/.?]+) }
  post 'rasas(.:format)' => 'rasas#create', :as => 'create_rasa'
  put 'rasas/:id(.:format)' => 'rasas#update', :as => 'update_rasa', :constraints => { :id => %r([^/.?]+) }
  delete 'rasas/:id(.:format)' => 'rasas#destroy', :as => 'destroy_rasa', :constraints => { :id => %r([^/.?]+) }

end
