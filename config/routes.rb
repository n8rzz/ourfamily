Rails.application.routes.draw do
  devise_for :users,
             controllers: { registrations: 'registrations' },
             path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
  root 'posts#index'

  resources :posts
end
