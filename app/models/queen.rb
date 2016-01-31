class Queen < Piece
  
  def make(color, x = nil, y = nil)
    super(color, true, "queen", x, y)
  end

  def vectors
    [[1, 1], [-1, 1], [-1, -1], [1, -1], [1, 0], [0, 1], [-1, 0], [0, -1]]
  end
end
