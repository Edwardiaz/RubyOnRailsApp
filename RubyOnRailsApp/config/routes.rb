Rails.application.routes.draw do
  
  devise_for :users
  get 'home/index'
  root to: "home#index"

  #get "articles/user/:user_id", to: "articles#from_author"
  resources :categories
  
  resources :articles do
    get "user/:user_id", to: "articles#from_author", on: :collection
  end

# Hay que respetar rest tanto como se pueda
  #get "articles", to: "articles#index"
  #get "articles/new", to: "articles#new", as: :new_articles
  #get "articles/:id", to: "articles#show"
  #get "articles/:id/edit", to: "articles#edit"
  #patch "articles/:id", to: "articles#update", as: :article
  #post "articles", to: "articles#create"
  #delete "articles/:id", to: "articles#destroy"

end
