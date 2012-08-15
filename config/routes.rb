Notifier::Application.routes.draw do  

  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}

  root :to => "home#index"
  resources :users
end
#== Route Map
# Generated on 15 Aug 2012 15:21
#
#         user_session POST   /users/login(.:format)         devise/sessions#create
# destroy_user_session DELETE /users/logout(.:format)        devise/sessions#destroy
#        user_password POST   /users/password(.:format)      devise/passwords#create
#    new_user_password GET    /users/password/new(.:format)  devise/passwords#new
#   edit_user_password GET    /users/password/edit(.:format) devise/passwords#edit
#                      PUT    /users/password(.:format)      devise/passwords#update
#                 root        /                              home#index
#                users GET    /users(.:format)               users#index
#                      POST   /users(.:format)               users#create
#             new_user GET    /users/new(.:format)           users#new
#            edit_user GET    /users/:id/edit(.:format)      users#edit
#                 user GET    /users/:id(.:format)           users#show
#                      PUT    /users/:id(.:format)           users#update
#                      DELETE /users/:id(.:format)           users#destroy
