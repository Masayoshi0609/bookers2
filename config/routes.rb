Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"
  resources :post_books, except: [:new]
  resources :users, only: [:show, :edit, :update]
end
