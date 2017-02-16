Rails.application.routes.draw do
  namespace :api do
    resources :weapons
  end
end
