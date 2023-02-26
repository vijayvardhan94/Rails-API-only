Rails.application.routes.draw do
  get 'bookstore/index'
  namespace :api do
    namespace :v1 do
      resources :books, only: [:index, :create, :destroy, :show]
    end
    namespace :v2 do
      resources :stores, only: [:index, :create, :destroy, :show]
    end
  end
  
end
