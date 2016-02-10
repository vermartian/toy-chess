class PiecesController < ApplicationController
  include GamesHelper
  def update
    @piece = Piece.find(params[:id])
    @game = @piece.game
    @fig = @piece.figure
    channel = "public-conversation"
    capable = @piece.move_capable?(params[:piece][:x], params[:piece][:y])
    blocked = @piece.blocked?(params[:piece][:x], params[:piece][:y])
    life = params[:piece][:state]
    piece_turn = @game.turn? == @piece.color
    unless blocked
      if (capable && piece_turn) || (life == "off" && !piece_turn)
        @piece.move(piece_params)
        if @piece.state == "off"
          Pusher.trigger(channel, 'kill_event', { piece: @piece, fig: @fig })
        else
          turn_count = @game.turn += 1
          @game.update_attributes(turn: turn_count)
          Pusher.trigger(channel, 'move_event', { piece: @piece, fig: @fig })
        end
      end
    end
    render json: { piece: @piece, fig: @fig }
  end

  private

  def piece_params
    params.require(:piece).permit(:x, :y, :state)
  end
end
