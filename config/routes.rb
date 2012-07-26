Notifier::Application.routes.draw do  

  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}

  root :to => "home#index"
  resource :users

end
