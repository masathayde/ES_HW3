Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => redirect('/movies')
  # get '/movies/search_directors', to: 'movies#search_same_directors', as: :search_directors
  resources :movies do
    collection do
      get 'search_directors'
    end
  end
end
