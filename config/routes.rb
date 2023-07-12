Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"
  
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  
  resources :books
  resources :users, only: [:index, :show, :edit, :update]

  resources :books, only: [:new, :create, :index, :show, :destroy] do
  end


  get 'homes/about' => 'homes#about', as: 'about'

end
