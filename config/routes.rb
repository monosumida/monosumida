Rails.application.routes.draw do
  resources :topics
  resources :blogs do
    collection do
      get 'preview', as: :preview
    end
  end
  namespace :admin do
    resources :sessions
    resources :blogs, only: %i[index edit update destroy]
    root 'dashboard#index'
  end
  root 'home#top'
end
