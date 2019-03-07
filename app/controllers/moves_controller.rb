class MovesController < ApplicationController
  before_action :set_pokemon, only: [:index, :create]
  before_action :set_move, only: [:show, :update, :destroy]
  def index
    render json: @pokemon.moves
  end

  def show
    render json: @move
  end

  def create
    @move = @pokemon.moves.new(move_params)
    if @move.save 
      render json: @move
    else
      render_error_page(@move)
    end

  end

  def update
    if @move.update(move_params)
      render json: @move
    else 
      render_error_page(@move)
    end

  end

  def destroy
    @move.destroy
    render json: { message: "Move Deleted" }, status: :ok
  end

  private
    def set_move
      @move.find(params[:id])
    end

    def set_pokemon
      @pokemon.find(params[:pokemon_id])
    end

    def move_params
      params.require(:move).permit(:name)
    end
end
