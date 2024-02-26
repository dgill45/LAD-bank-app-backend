Rails.application.routes.draw do
  
    resources :customers do
      resources :accounts do
        resources :transactions
      end
    end
  # Session management
    post '/login', to: 'sessions#login'
    delete '/logout', to: 'sessions#logout'

  # User management
    resources :users, only: [:index, :create, :show, :update, :destroy] do

    end

  # Signup route (if you're handling signup in UsersController)
    post '/signup', to: 'users#create'

  get 'home/index'
    # Root route
  root 'home#index'
end
