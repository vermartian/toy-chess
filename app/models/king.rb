class King < Piece
  
  def make(color, x = nil, y = nil)
    super(color, false, "king", x, y)
  end

  def vectors
    v = [[1, 1], [-1, 1], [-1, -1], [1, -1], [1, 0], [0, 1], [-1, 0], [0, -1]]
    if self.can_castle?
      v << [2, 0]
      v << [-2, 0]
    end
    v
  end
end
