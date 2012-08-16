Notifier::Application.routes.draw do  

  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}

  resources :messages do
    member do
      get :new
      get :notify
    end
  end

  root :to => "messages#new"

  resources :users  

end
