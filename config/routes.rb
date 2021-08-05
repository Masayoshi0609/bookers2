Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"
  get "home/about" => "homes#about"
  resources :books, except: [:new] do
   resource :favorites, only: [:create, :destroy]
   resources :book_comments, only: [:create, :destroy]
  end
  resources :users, only: [:show, :edit, :update, :new, :index]
 
  post "users/:id/edit" => "users#edit"
  post "users/:id" => "users#create"
end
