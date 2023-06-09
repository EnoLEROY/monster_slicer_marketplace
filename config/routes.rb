Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "/dashboard", to: "pages#dashboard"
  resources :products, only: [:index, :show, :new, :create] do
    member do
      get :details
    end
    resources :rentings, only: [:new, :create] do
      member do
        get :accept
        get :deny
      end
    end
  end
  resources :rentings, only: [:destroy]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
