class King < Piece

  def vectors
    v = [[1, 1], [-1, 1], [-1, -1], [1, -1], [1, 0], [0, 1], [-1, 0], [0, -1]]
    if self.castle_ks?
      v << [2, 0]
    end
    if self.castle_qs?
      v << [-2, 0]
    end
    v
  end

  def escape?
    # todo
    true
  end

  def castle_ks?
    if state == 'moved'
      return false
    end
    unless castle_rook('king')
      return false
    end
    if castle_rook('king').state == 'moved'
      return false
    end
    if blocked?(7, y)
      return false
    end
    true
  end

  def castle_qs?
    if state == 'moved'
      return false
    end
    unless castle_rook('queen')
      return false
    end
    if castle_rook('queen').state == 'moved'
      return false
    end
    if blocked?(0, y)
      return false
    end
    true
  end

  def castle_rook(side)
    if side == 'king'
      game.pieces.find_by(type: 'Rook', x: 7, y: self.y)
    elsif side == 'queen'
      game.pieces.find_by(type: 'Rook', x: 0, y: self.y)
    end
  end
end
