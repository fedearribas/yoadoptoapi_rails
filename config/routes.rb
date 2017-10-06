Rails.application.routes.draw do
  resources :marked_publications
  get '/marked_publications/user/:user_id/type/:publication_type', to: 'marked_publications#get_by_user_id_and_publication_type'
  get '/marked_publications/user/:user_id/:publication_id', to: 'marked_publications#get_by_user_id_and_publication_id'
  
  resources :comments
  get '/comments/publication/:publication_id', to: 'comments#get_by_publication_id'
  
  mount_devise_token_auth_for 'User', at: 'auth'
  resources :publications
    get '/publications/type/:publication_type', to: 'publications#get_publications_by_type'
    #get '/adoptions/type/missing', to: 'adoptions#get_missing'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
