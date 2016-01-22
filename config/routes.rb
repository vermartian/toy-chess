Rails.application.routes.draw do
  root "games#index"
  resources :games, only: [:index, :new, :create, :show] do
  end
end
