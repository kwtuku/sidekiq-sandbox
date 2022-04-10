Rails.application.routes.draw do
  root 'pokemons#index'
  resources :pokemons, only: %i[index]
  post 'pokemons/create_all', to: 'pokemons#create_all'
  delete 'pokemons/destroy_all', to: 'pokemons#destroy_all'
end
