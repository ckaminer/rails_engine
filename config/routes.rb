Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      namespace :merchants do
        get "/find_all", to: "find#index"
        get "/find", to: "find#show"
        get "/random", to: "random#show"
      end
      resources :merchants, only: [:index, :show]

      namespace :customers do
        get "/find_all", to: "find#index"
        get "/find", to: "find#show"
        get "/random", to: "random#show"
      end
      resources :customers, only: [:index, :show]

      namespace :invoices do
        get "/find_all", to: "find#index"
        get "/find", to: "find#show"
        get "/random", to: "random#show"
      end
      namespace :items do
        get "/find_all", to: "find#index"
        get "/find", to: "find#show"
        get "/random", to: "random#show"
      end
      namespace :invoice_items do
        get "/find_all", to: "find#index"
        get "/find", to: "find#show"
        get "/random", to: "random#show"
      end
      resources :invoices, only: [:index, :show]
      resources :items, only: [:index, :show]
      resources :invoice_items, only: [:index, :show]
    end
  end
end
