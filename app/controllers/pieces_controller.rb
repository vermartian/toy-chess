class PiecesController < ApplicationController
  include GamesHelper
  def update
    @piece = Piece.find(params[:id])
    @piece.update(piece_params)
    @game = @piece.game
    @fig = @piece.figure
    render json: { piece: @piece, fig: @fig }
  end

  private

  def piece_params
    params.require(:piece).permit(:x, :y, :state)
  end
end
