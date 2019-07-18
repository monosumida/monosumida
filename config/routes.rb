Rails.application.routes.draw do
  namespace :admin do
    resources :sessions
  end
  root 'home#top'
end
