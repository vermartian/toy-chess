class King < Piece

  def vectors
    v = [[1, 1], [-1, 1], [-1, -1], [1, -1], [1, 0], [0, 1], [-1, 0], [0, -1]]
    if self.can_castle?
      v << [2, 0]
      v << [-2, 0]
    end
    v
  end

  def can_castle?
    if state == 'moved'
      return false
    end
    true
  end

end
