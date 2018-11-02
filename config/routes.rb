Rails.application.routes.draw do
  root 'home#home'
  get '/contact', to: 'home#contact'
  post '/contact', to: 'home#contact_success'
  get '/team', to: 'home#team'

  resources :users, only: [:create, :destroy, :edit, :index]
  get '/register', to: 'users#new'

  resources :sessions, only: [:destroy]
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  resources :gossips do
    resources :likes, only: [:create, :destroy]
    resources :comments do
      resources :likes, only: [:create, :destroy]
      resources :replies do
        resources :likes, only: [:create, :destroy]
      end
    end
  end
end
