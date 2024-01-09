Rails.application.routes.draw do
  resources :users do
    resources :customers do
      resources :accounts do
        resources :transactions
      end
    end
  end
end
