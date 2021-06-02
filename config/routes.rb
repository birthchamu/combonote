Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "combos#index"
  resources :combos do
    resources :comments, only: [:create]
  end

  resources :comments, only: :destroy
  
  resources :users, only: :show
  
end
