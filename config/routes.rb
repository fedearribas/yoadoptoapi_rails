Rails.application.routes.draw do
  resources :marked_adoptions
  get '/marked_adoptions/user/:user_id', to: 'marked_adoptions#get_by_user_id'
  get '/marked_adoptions/user/:user_id/:adoption_id', to: 'marked_adoptions#get_by_user_id_and_adoption_id'
  
  resources :comments
  get '/comments/adoption/:adoption_id', to: 'comments#get_by_adoption_id'
  
  mount_devise_token_auth_for 'User', at: 'auth'
  resources :adoptions
    get '/adoptions/type/:publication_type', to: 'adoptions#get_adoptions_by_type'
    #get '/adoptions/type/missing', to: 'adoptions#get_missing'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
