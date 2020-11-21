Rails.application.routes.draw do
  
  
  # get 'sessions/new'
  # get 'users/index'
  # # get 'reviews/index'
  # get 'computers/index'
  
 
  get 'search', to: "computers#search"
  
  get 'signup' => 'users#new'
  resources :users
  resources :sessions
  get 'login' => 'sessions#new'
  get 'logout' => 'sessions#destroy'
  get '/auth/:provider/callback', to: 'authentications#create'
  
  # get computers/6/reviews/3
  resources :computers do 
    resources :reviews
  end
  
    
  # get 'home/index'
  root to: 'home#index'
  get "about" => 'home#about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
