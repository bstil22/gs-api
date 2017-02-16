Rails.application.routes.draw do
  namespace :api do
    get '/guns', to: 'weapons#index'
  end
end
