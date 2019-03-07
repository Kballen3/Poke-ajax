class PokemonsController < ApplicationController
  before_action :set_pokemon, only: [:show, :update, :destroy]

  def index
    @pokemons = Pokemon.all
  end

  def show
  end

  def create
    @pokemon = Pokemon.new(pokemon_params)
    if @pokemon.save 
      render json: @pokemon
    else 
      render_error_page(@game)
    end
  end

  def update
    if @pokemon.update(pokemon_params)
      render json: @pokemon 
    else 
      render_error_page(@pokemon)
    end
     
  end

  def destroy
    @pokemon.destroy
    render json: { message: "Let Pokemon go free" }, status: :ok
    
  end

  private
    def set_pokemon
      @pokemon.find(params[:id])
    end

    def pokemon_params
      params.require(:pokemon).permit(:name)
    end
end
