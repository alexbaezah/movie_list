Rails.application.routes.draw do



 
  get "movies", to: 'movies#index'
  get "movies/new"
  post "movies", to: "movies#create"
  get 'movies/list'
  get "movies/:id/edit", to: "movies#edit", as: 'movie_edit'
  patch "movies/:id", to: "movies#update"
  get "movies/:id", to: "movies#show", as: 'movie'
  delete "movies/:id", to: "movies#destroy"
  get "movies/:id/favorite", to: "movies#favorite", as: "movie_favorite"

  resources :movies do 
    member do 
      post "add_tag"
    end
  end

  resources :tag
 

  root 'movies#index'

end