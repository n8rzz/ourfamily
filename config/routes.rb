Rails.application.routes.draw do
  root 'homescreen#index'

  devise_for :users,
             controllers: { registrations: 'registrations' },
             path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }

  resources :posts
end
