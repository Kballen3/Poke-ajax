Rails.application.routes.draw do
  root "pokemons#index"

  resources :pokemons do 
    resources :moves
  end
end
