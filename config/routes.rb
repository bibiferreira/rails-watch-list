Rails.application.routes.draw do
  get 'movies/index'
  get 'movies/new'
  get 'movies/show'
  root to: 'lists#index'

  resources :lists do
    resources :bookmarks, only: [:new, :create, :destroy]
  end

  resources :movies 
end
