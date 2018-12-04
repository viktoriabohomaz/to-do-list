# frozen_string_literal: true

Rails.application.routes.draw do
  apipie
  mount_devise_token_auth_for 'User',
                              at: 'api/v1/auth',
                              controllers: {
                                registrations: 'api/v1/auth/registrations',
                                sessions: 'api/v1/auth/sessions'
                              },
                              skip: [:omniauth_callbacks]

  namespace :api do
    namespace :v1 do
      resources :projects do
        resources :tasks, only: %i[index create]
      end

      resources :tasks, only: %i[update destroy] do
        resources :comments, only: %i[index create]
      end

      resources :comments, only: %i[destroy]
    end
  end
end
