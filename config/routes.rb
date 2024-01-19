Rails.application.routes.draw do
  # resources :users do
  #end
    resources :customers do
      resources :accounts do
        resources :transactions
      end
    end
  root 'home#index'
end
