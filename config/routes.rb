Rails.application.routes.draw do
  resources :topics
  resources :blogs do
    member do
      post 'preview'
    end
  end
  namespace :admin do
    resources :sessions
  end
  root 'home#top'
end
