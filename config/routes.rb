Rails.application.routes.draw do
  root "static_pages#home"
  get 'static_pages/home'
  get 'static_pages/help'
  devise_for :users
  namespace :admin do
    resources :users
    resources :static_pages
  end

  resources :categories
  resources :categories do
    member do
      get :new_child
    end
  end

  resources :products do
    resources :images
    member do
      get :list_image
    end
  end



end
