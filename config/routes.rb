Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :users do 
    resources :categories do
      resources :expenditures
    end
  end
  # Defines the root path route ("/")
  root "pages#home"
end
