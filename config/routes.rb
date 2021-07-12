Rails.application.routes.draw do

  devise_for :users
  root 'homes#top'
  get "home/about" => 'homes#show', as:'about'
  resources :users, only: [:index, :edit, :show, :create]
  resources :books, only: [:index, :show, :create]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
