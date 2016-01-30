class GamesController < ApplicationController
  include GamesHelper
  def index
    @player = current_player
    @games = Game.joins(gameplays: :player)
  end

  def show
    @player = current_player
    @game = Game.find(params[:id])
    figuratize(@game)
    fill_graves(@game)
  end

  def new
    @game = Game.new
    @gameplay = Gameplay.new
  end

  def create
    @player = current_player
    @game = Game.new(game_params)
    if @game.save
      Gameplay.create(game_id: @game.id, player_id: current_player.id, color: params[:color])
      # flash[:notice] = "Game Created Successfully"
      # m = "#{@player.user_name} just started a game"
      # m += " https://toy-chess.herokuapp.com/games/#{@game.id}"
      # $twitter.update(m)
      redirect_to game_path(@game)
    else
      flash[:errors] = @game.errors.full_messages.join(". ")
      render :new
    end
  end

  private

  def game_params
    params.require(:game).permit(:title)
  end

end
