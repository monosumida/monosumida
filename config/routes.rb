Rails.application.routes.draw do
  resources :topics
  resources :blogs
  namespace :admin do
    resources :sessions
  end
  root 'home#top'
end
