class Piece < ActiveRecord::Base
  include GamesHelper
  belongs_to :player
  belongs_to :game

  def vectors(vectors = [])
    @vectors ||= vectors
  end

  def move(params)
    xpos, ypos, channel = params[:x].to_i, params[:y].to_i, 'public-conversation'
    if game.piece_at?(xpos, ypos)
      captured_piece = game.piece_at(xpos, ypos)
      captured_piece_fig = captured_piece.figure
      captured_piece.update_attributes(x: 8, y:8, state: 'off')
      Pusher.trigger(channel, 'move_event', {
        piece: captured_piece,
        fig: captured_piece_fig
      })
    end
    if type == 'King' && (self.x - xpos).abs == 2
      if (self.x - xpos) == -2
        castle_rook('king').update_attributes(x: 5, state: 'moved')
        castle_rook = game.pieces.find_by(type: 'Rook', x: 5, y: self.y)
        castle_rook_fig = castle_rook.figure
        Pusher.trigger(channel, 'move_event', {
          piece: castle_rook,
          fig: castle_rook_fig
        })
      elsif (self.x - xpos) == 2
        castle_rook('queen').update_attributes(x: 3, state: 'moved')
        castle_rook = game.pieces.find_by(type: 'Rook', x: 3, y: self.y)
        castle_rook_fig = castle_rook.figure
        Pusher.trigger(channel, 'move_event', {
          piece: castle_rook,
          fig: castle_rook_fig
        })
      end
    end
    self.update(params)
  end

  def move_capable?(file, rank)
    vector = [file.to_i - x, rank.to_i - y]
    if vector == [0,0]
      return false
    end
    unless sliding
      return vectors.include?(vector)
    end
    vectors.each do |v|
      (1..8).each do |squares|
        if vector == [v[0] * squares, v[1] * squares]
          return true
        end
      end
    end
    false
  end

  def blocked?(to_x, to_y)
    if type == "Knight"
      return false
    end
    if to_x == '8' || to_y == '8'
      return false
    end
    square_path(to_x, to_y).each do |sq|
      if game.piece_at?(sq[0], sq[1])
        return true
      end
    end
    diagonal_path(to_x, to_y).each do |sq|
      if game.piece_at?(sq[0], sq[1])
        return true
      end
    end
    false
  end
end
