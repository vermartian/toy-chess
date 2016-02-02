class PiecesController < ApplicationController
  include GamesHelper
  def update
    @piece = Piece.find(params[:id])
    @piece.update(piece_params)
    @game = @piece.game
    @fig = @piece.figure
    channel = "public-conversation"
    if @piece.state == "off"
      Pusher.trigger(channel, 'kill_event', { piece: @piece, fig: @fig })
    else
      Pusher.trigger(channel, 'move_event', { piece: @piece, fig: @fig })
    end
    render json: { piece: @piece, fig: @fig }
  end

  private

  def piece_params
    params.require(:piece).permit(:x, :y, :state)
  end
end
