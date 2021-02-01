Rails.application.routes.draw do
  resources :posts
  resources :comments
  devise_for :users, controllers: {
    sessions: 'user/sessions'
  }
  root :to => 'home#index'  
  
  resources :forums
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
