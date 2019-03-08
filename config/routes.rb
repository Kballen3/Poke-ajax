Rails.application.routes.draw do
  root "pokemons#index"

  get 'pokemon_form', to: 'pokemonss#form'

  resources :pokemons do 
    resources :moves
  end
end
