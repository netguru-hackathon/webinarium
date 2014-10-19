Rails.application.routes.draw do

  root 'webinars#index'

  get '/auth' => 'sessions#index'
  get '/auth/:provider/callback' => 'sessions#create'
  delete '/auth/signout' => 'sessions#destroy'

  resources :webinars, except: [:destroy]

end
