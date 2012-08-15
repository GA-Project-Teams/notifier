Notifier::Application.routes.draw do  

  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}

  root :to => "messages#new"
  resources :users
  resources :messages
end
