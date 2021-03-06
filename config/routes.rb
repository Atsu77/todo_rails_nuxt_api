Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :todos, only: %i[index create update destroy]
      resources :users, only: %i[index create]
    end
  end
end
