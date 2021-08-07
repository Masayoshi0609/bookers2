Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"
  get "home/about" => "homes#about"
  resources :books, except: [:new] do
   resource :favorites, only: [:create, :destroy]
   resources :book_comments, only: [:create, :destroy]
  end
  resources :users, only: [:show, :edit, :update, :new, :index] do
   resource :relationships, only: [:create, :destroy]
   get "followings" => "relationships#followings", as: "followings"
   get "followers" => "relationships#followers", as: "followers"
  
  end      
 
  post "users/:id/edit" => "users#edit"
  post "users/:id" => "users#create"
end
