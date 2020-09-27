Rails.application.routes.draw do
  root 'homescreen#index'
  get 'home' => 'homescreen#index'

  devise_for :users,
             controllers: { registrations: 'registrations' },
             path_names: { sign_in: 'login', sign_out: 'logout'} #, sign_up: 'register' }

  resources :posts, except: :index
  resources :images, except: [:index, :edit, :update]
  get 'gallery' => 'images#index'
  get 'pages/index' => 'static_pages#index'
end
