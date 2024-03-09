Rails.application.routes.draw do
  
    resources :customers do
      resources :accounts do
        resources :transactions
      end
    end
  # Session management
    post '/login', to: 'sessions#login'
    get '/logged_in', to: 'sessions#is_logged_in?'
    delete '/logout', to: 'sessions#logout'

  # User management
    resources :users, only: [:index, :create, :show, :update, :destroy] do

    end

  # Signup route (if you're handling signup in Customers Controller)
    post '/signup', to: 'customers#create'

  get 'home/index'
    # Root route
  root 'home#index'
end
