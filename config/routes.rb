Rails.application.routes.draw do

  get 'relationships/create'
  get 'relationships/destroy'
  devise_for :users
  root 'homes#top'
  get "home/about" => 'homes#show', as:'about'
  resources :users
  resources :books do 
    resource :favorites, only: [:create, :destroy]
    # get 'book_comments/create'
    # get 'book_comments/destroy'
    resources :book_comments, only: [:create, :destroy]
    # resourceと単数にすると後ろに必要となるidが不要となる。
  end 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
  