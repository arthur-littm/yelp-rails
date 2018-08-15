Rails.application.routes.draw do
  namespace :admin do
    get 'restaurants/index'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "restaurants#index"

  resources :restaurants do
    resources :reviews, only: [:new, :create]

    collection do
      get "top", to: "restaurants#top"
    end
    member do
      get "chef", to: "restaurants#chef"
    end
  end

  namespace :admin do
    resources :restaurants, only: [:index]
  end

  # get "admin/restaurants", to: "admin/restaurants#index"
  # get "restaurants/:restaurant_id/reviews/new", to: "reviews#new"

  # get "restaurants/top", to: "restaurants#top"
  # get "restaurants/:id/chef", to: "restaurants#chef"
end
