Rails.application.routes.draw do
  # mount_devise_token_auth_for 'User', at: 'auth'
   devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}, controllers: {omniauth_callbacks: "omniauth_callbacks"}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # get '/auth', to:'omniauth_callbacks#google_oauth2', as:'google_oauth2'
  root 'homes#home'
end
