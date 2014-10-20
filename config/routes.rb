Rails.application.routes.draw do

  root 'webinars#index'

  get '/auth' => 'sessions#index'
  get '/auth/:provider/callback' => 'sessions#create'
  post'/auth/:provider/callback' => "sessions#create" if Rails.env.development? #for the 'developer' strategy
  delete '/auth/signout' => 'sessions#destroy'

  resources :webinars, except: [:destroy]

end
