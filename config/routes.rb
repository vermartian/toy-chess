Rails.application.routes.draw do
  devise_for :players
  root "games#index"
  resources :games, only: [:index, :new, :create, :show] do
    resources :gameplays, only: [:show, :index]
  end

end
