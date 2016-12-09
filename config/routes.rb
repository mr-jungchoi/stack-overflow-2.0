Rails.application.routes.draw do
  resources :users

  resources :questions do
    resources :answers, only: :create
    resources :comments, only: [:create, :update, :destroy]
  end

  resources :answers, except: :show do
    resources :comments, only: [:create, :update, :destroy]
  end

  post '/votes' => 'votes#post'

  get '/login' => 'sessions#new'
  post '/sessions' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  root 'questions#index'
end
