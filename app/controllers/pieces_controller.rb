class PiecesController < ApplicationController
  include GamesHelper
  def update
    @piece = Piece.find(params[:id])
    @game = @piece.game
    @fig = @piece.figure
    channel = "public-conversation"
    if @piece.move_capable?(params[:piece][:x], params[:piece][:y]) || params[:piece][:state] == "off"
      @piece.update(piece_params)
      if @piece.state == "off"
        Pusher.trigger(channel, 'kill_event', { piece: @piece, fig: @fig })
      else
        Pusher.trigger(channel, 'move_event', { piece: @piece, fig: @fig })
      end
    end
    render json: { piece: @piece, fig: @fig }
  end

  private

  def piece_params
    params.require(:piece).permit(:x, :y, :state)
  end
end
