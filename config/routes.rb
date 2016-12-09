Rails.application.routes.draw do
  resources :users

  resources :questions do
    resources :answers
    resources :comments
  end

  resources :answers do
    resources :comments
  end

  post '/votes' => 'votes#post'

  get '/login' => 'sessions#new'
  post '/sessions' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
end
