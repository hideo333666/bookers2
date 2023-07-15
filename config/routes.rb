Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end


  resources :users, only: [:index, :show, :edit, :update]

  resources :books, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
  end


  get 'home/about' => 'homes#about', as: 'about'

end
