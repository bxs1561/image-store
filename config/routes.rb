Rails.application.routes.draw do
  # mount_devise_token_auth_for 'User', at: 'auth'
  #  devise_for :users, path: 'auth', path_names: {
  #       sign_in: 'login',
  #       sign_out: 'logout',
  #       password: 'secret',
  #       sign_up: 'signup'
  #   }
   devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}, controllers: {omniauth_callbacks: "omniauth_callbacks"}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # get '/auth', to:'omniauth_callbacks#google_oauth2', as:'google_oauth2'
  #  scope module: :v1, constraints: ApiVersion.new('v1', true) do
  #  namespace :api, defaults: {format: 'json'} do
   namespace :api do

     # mount_devise_token_auth_for 'User', at: 'auth'
     namespace :v1 do
       # resources :store_images, only:[:index, :show, :update] do
     get 'image-store', to: 'images#index'
     # get 'image-stores', to: 'images#new'
     post 'image-stores', to: 'images#create'

       # post 'image-stores', to: 'images#create'
     end
   end
   # get '/images', to: 'images#new', as: 'store_images'

   # post '/show', to:'images#index'
  # get '/edit' ,to: 'images#edit', as: 'store_image'
  # get '/show', to:'images#index'

   get '/images', to: 'images#index'
   get '/images/new', to:'images#new', as: 'store_images'
   post '/images/new', to:'images#create'
   post '/images', to:'images#create'
   get '/images/:id/edit', to: 'images#edit'
   patch '/images/:id', to:'images#update', as:'store_image'
   delete '/images/:id', to: 'images#destroy'
   root 'homes#home'
   get '/all', to: 'images#all'
   get '/modal', to: 'images#modal'


   resources :images
  # resources :store_image
end
