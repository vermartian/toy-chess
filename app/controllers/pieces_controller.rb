class PiecesController < ApplicationController
  include GamesHelper
  def update
    @piece = Piece.find(params[:id])
    @fig = @piece.figure
    @game = @piece.game
    player = current_player
    channel = "public-conversation"
    capable = @piece.move_capable?(params[:piece][:x], params[:piece][:y])
    blocked = @piece.blocked?(params[:piece][:x], params[:piece][:y])
    life = params[:piece][:state]
    piece_turn = @game.turn? == @piece.color
    player_turn = @game.gameplays.find_by(player: player).color == @game.turn?
    unless blocked
      if capable && piece_turn && player_turn
        @piece.check_move(piece_params)
      end
    end
    render json: { piece: @piece, fig: @fig }
  end

  private

  def piece_params
    params.require(:piece).permit(:x, :y, :state)
  end
end
