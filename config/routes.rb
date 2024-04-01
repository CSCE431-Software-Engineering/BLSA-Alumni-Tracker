Rails.application.routes.draw do
  #oAuth
  root to: 'users#index'
  devise_for :admins, controllers: { omniauth_callbacks: 'admins/omniauth_callbacks' }
  devise_scope :admin do
    get 'admins/sign_in', to: 'admins/sessions#new', as: :new_admin_session
    get 'admins/sign_out', to: 'admins/sessions#destroy', as: :destroy_admin_session
  end

  resources :education_infos do
    member do
      get :delete
    end
  end

  resources :users do
    member do
      get :delete
    end
    collection do
      get :view_admins
    end
  end

  resources :faqs, only: [:index]

  resources :universities
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
