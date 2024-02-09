Rails.application.routes.draw do
  resources :education_infos do
    member do
      get :delete
    end
  end
  
  resources :users do
    member do
      get :delete
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
