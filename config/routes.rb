Rails.application.routes.draw do
  resources :marked_adoptions
  get '/marked_adoptions/user/:user_id', to: 'marked_adoptions#get_by_user_id'
  post '/marked_adoptions/user/:user_id', to: 'marked_adoptions#create_by_user_id'
  resources :comments
  mount_devise_token_auth_for 'User', at: 'auth'
  resources :adoptions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
