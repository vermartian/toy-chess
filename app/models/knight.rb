class Knight < Piece
  
  def make(color, x = nil, y = nil)
    super(color, false, "knight", x, y)
  end

  def vectors
    [[-1,2], [1,2], [2,1], [2,-1], [-1,-2], [1,-2], [-2,-1], [-2,1]]
  end
end
