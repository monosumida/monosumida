Rails.application.routes.draw do
  resources :blogs
  namespace :admin do
    resources :sessions
  end
  root 'home#top'
end
