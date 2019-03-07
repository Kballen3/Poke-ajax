namespace :populate do
  desc "Populate Pokemons"
  task pokemons: :environment do
    20.times do
      pokemon = Pokemon.create(name: Faker::Games::Pokemon.name)
      4.times { Move.create(name: Faker::Games::Pokemon.move, pokemon_id: pokemon.id)}
      
    end
  end

end
