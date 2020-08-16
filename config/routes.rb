Rails.application.routes.draw do
  resources :messages
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
  root to: 'pages#home'
  get 'pages/about'
  get 'pages/contact'
  resources :rooms
  resources :chatrooms
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
