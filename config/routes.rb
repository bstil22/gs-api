Rails.application.routes.draw do
  namespace :api do
    resources :weapons
    post 'user_token' => 'user_token#create'
  end
end
