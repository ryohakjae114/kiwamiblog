Rails.application.routes.draw do
  scope module: :users do
    resource :profile, only: %i[edit update]
  end
  devise_for :users
  root 'posts#index'
  get 'up' => 'rails/health#show', as: :rails_health_check
end
