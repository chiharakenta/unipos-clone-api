Rails.application.routes.draw do
  get 'clap/create'
  namespace 'api' do
    namespace 'v1' do
      resources :posts, only: [:index, :create, :destroy]
      resources :users, only: [:index, :show, :create, :update, :destroy]
      resources :claps, only: [:index, :create]
    end
  end
end
