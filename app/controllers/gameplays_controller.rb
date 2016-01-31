class GameplaysController < ApplicationController
  def index
    @games = Game.where(state: "pending")
    @gameplay = Gameplay.new
  end
  def create
    @gameplay = Gameplay.new(gameplay_params)
    if @gameplay.save
      redirect_to game_path(@gameplay.game_id)
    else
      render :index
    end
  end

  def update
    @game = Game.find(params[:game_id])
    @gameplay = Gameplay.find(params[:id])
    if @gameplay.update(gameplay_params)
      redirect_to game_path(@game)
    else
      render new_game_path
    end
  end

  private

  def gameplay_params
    params.require(:gameplay).permit(:color, :game_id, :player_id)
  end

end
