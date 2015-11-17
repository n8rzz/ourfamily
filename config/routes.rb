Rails.application.routes.draw do
  root 'static_pages#index'

  resources :images, except: :index
  get 'gallery' => 'images#index'

  devise_for :users,
             controllers: { registrations: 'registrations' },
             path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }

  # TODO: index route needs to be removed completely once static_pages controller is built
  resources :posts, except: :index
  get 'home' => 'homescreen#index'
end
