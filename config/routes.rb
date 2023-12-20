Rails.application.routes.draw do
  resources :users do
    collection do
      post :import
    end
  end
  root "users#index"
end
