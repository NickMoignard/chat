Rails.application.routes.draw do


  devise_for :users, controllers: {
    sessions: 'user/sessions'
  }
  root :to => 'home#index'  
  
  get '/about', to: 'home#about', as: 'about'
  get '/contact', to: 'home#contact', as: 'contact'
  get 'legals', to: 'home#legals', as: 'legals'


  resources :forums
  resources :posts
  resources :comments

  post '/forum/:id', to: 'forum#new_post', as: 'new_forum_post'
  
end
