Rails.application.routes.draw do
  devise_for :players
  root "games#index"
  resources :games, only: [:index, :new, :create, :show, :update] do
    resources :gameplays, only: [:update]
  end
  resources :pieces, only: [:update]
  resources :gameplays, only: [:index, :create]
end
