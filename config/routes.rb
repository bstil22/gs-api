Rails.application.routes.draw do
  namespace :api do
    get '/foo', to: 'weapons#index'
  end
end
