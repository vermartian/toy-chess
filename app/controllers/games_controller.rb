class GamesController < ApplicationController
  def index
  end
  def show
  end

  def new
    @game = Game.new
    @player = Player.new
  end
  def create
    
  end

end
