class GameplaysController < ApplicationController
  def index
  end
  def show
  end

  def new
    @game = Game.new
    @player = current_player
    @gameplay = Gameplay.new(player_id: @player, game_id: @game)
  end
  def create

  end

end
