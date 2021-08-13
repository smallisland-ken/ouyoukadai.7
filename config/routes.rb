Rails.application.routes.draw do

  get 'searches/search'
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
  
  # フォロワー機能のルーティング
  resources :users, only: [:index, :show, :edit, :update] do
    resource :relationships, only: [:create, :destroy]
  get 'followings' => 'relationships#followings', as: 'followings'
  get 'followers' => 'relationships#followers', as: 'followers'
  # resourceはindex,show,editなどにしか使用できず、フォロワー機能についてはfollowersアクションを自作しているため。
  end
  
  get '/search', to: 'searches#search'
    
  # get 'relationships/create'
  # get 'relationships/destroy'  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

