Rails.application.routes.draw do
  get 'users/show'
  get 'users/edit'
  devise_for :users
  root to: "homes#top"
  resources :books, only: [:new, :create, :index, :show, :destroy] do
  end
  resources :users, only: [:show, :index, :edit, :update]
  
  
  
  get 'homes/about' => 'homes#about', as: 'about'
  
end
