Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      namespace :merchants do
        get "/find_all", to: "find#index"
        get "/find", to: "find#show"
        get "/random", to: "random#show"
        get "/:id/items", to: "items#index"
        get "/:id/invoices", to: "invoices#index"
      end
      resources :merchants, only: [:index, :show]

      namespace :customers do
        get "/find_all", to: "find#index"
        get "/find", to: "find#show"
        get "/random", to: "random#show"
        get "/:id/invoices", to: "invoices#index"
        get "/:id/transactions", to: "transactions#index"
      end
      resources :customers, only: [:index, :show]

      namespace :invoices do
        get "/find_all", to: "find#index"
        get "/find", to: "find#show"
        get "/random", to: "random#show"
        get "/:id/transactions", to: "transactions#index"
        get "/:id/invoice_items", to: "invoice_items#index"
        get "/:id/items", to: "items#index"
        get "/:id/customer", to: "customers#index"
        get "/:id/merchant", to: "merchants#index"

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
        get "/:id/invoice", to: "invoices#show"
        get "/:id/item", to: "items#show"
      end
      resources :invoices, only: [:index, :show]
      resources :items, only: [:index, :show]
      resources :invoice_items, only: [:index, :show]

      namespace :transactions do
        get "/find_all", to: "find#index"
        get "/find", to: "find#show"
        get "/random", to: "random#show"
        get "/:id/invoice", to: "invoices#show"
      end
      resources :transactions, only: [:index, :show]

    end
  end
end
