class GamesController < ApplicationController
  def index
  end

  def show
    @player = current_player
    @game = Game.find(params[:id])
    @gameplays = Gameplay.where(game: @game).to_a
  end

  def new
    @game = Game.new
    @gameplay = Gameplay.new(player_id: current_player.id)
  end

  def create
    @player = current_player
    @game = Game.new(game_params)
    @gameplay = Gameplay.new(player_id: current_player.id)
    if @game.save
      flash[:notice] = "Game Created Successfully"
      # m = "#{@player.user_name} just added a game to review! Check it out at"
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
