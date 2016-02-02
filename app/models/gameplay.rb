class Gameplay < ActiveRecord::Base
  after_create :assign_pieces
    
  belongs_to :game
  belongs_to :player

  def assign_pieces
    pieces = self.game.pieces
    pieces.each do |piece|
      if self.color == piece.color
        piece.update_attributes(player_id: self.player_id, state: 'on')
      end
    end
  end
end
