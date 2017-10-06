Rails.application.routes.draw do
  resources :pipelines

  root 'pipelines#index'

  end
