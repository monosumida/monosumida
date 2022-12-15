Rails.application.routes.draw do
  # resources :topics
  resources :blogs do
    collection do
      get 'preview', as: :preview
    end
  end
  namespace :api do
    resources :webhooks, only: %i[create]
    post 'webhooks/timeouts', to: 'webhooks#timeouts'
    post 'webhooks/unprocessable_entitis', to: 'webhooks#unprocessable_entitis'
    post 'webhooks/internal_server_errors', to: 'webhooks#internal_server_errors'
  end
  namespace :admin do
    resources :sessions
    resources :blogs, only: %i[index edit update destroy]
    resources :users, only: %i[index edit update destroy]
    resources :categories
    root 'dashboard#index'
  end
  get 'contacts', to: 'contacts#index'
  get 'error', to: 'contacts#error'
  get 'success', to: 'contacts#success'
  get 'mail_stop', to: 'home#mail_stop'
  root 'home#top'
end
