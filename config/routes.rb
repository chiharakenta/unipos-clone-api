Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :posts, only: [:index, :create, :destroy]
      resources :users, only: [:index, :show, :create, :update, :destroy]
      resources :claps, only: [:index, :create]
      resources :points, only: [:create, :update]
      resources :received_points, only: [:create, :update]
    end
  end
end
