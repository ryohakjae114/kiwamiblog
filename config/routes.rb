Rails.application.routes.draw do
  scope module: :users do
    resource :profile, only: %i[edit update]
    resources :posts, only: %i[new create edit update destroy]
    resources :relationships, only: %i[create destroy], param: :user_id
    resources :following_posts, only: %i[index]
  end
  devise_for :users
  root 'posts#index'
  resources :users, only: %i[show]
  get 'up' => 'rails/health#show', as: :rails_health_check
end
