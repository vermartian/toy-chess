class GamesController < ApplicationController
  include GamesHelper
  def index
    @player = current_player
    @games = Game.joins(gameplays: :player).where(gameplays: { player_id: @player })
  end

  def show
    @player = current_player
    @game = Game.find(params[:id])
    figuratize(@game)
    fill_graves(@game)
    player_color(@game)
  end

  def new
    @game = Game.new
    @gameplay = Gameplay.new
  end

  def create
    @player = current_player
    @game = Game.new(game_params)
    if @game.save
      Gameplay.create(game_id: @game.id, player_id: current_player.id, color: false)
      redirect_to game_path(@game)
    else
      flash[:errors] = @game.errors.full_messages.join(". ")
      render :new
    end
  end

  def update
    @game = Game.find(game_params)
    if @game.update
      redirect_to game_path(@game)
    else
      flash[:errors] = @game.errors.full_messages.join(". ")
    end
  end

  private

  def game_params
    params.require(:game).permit(:title, :state, :turn, :result, :winning_player_id, :draw_offerer_id)
  end

end
