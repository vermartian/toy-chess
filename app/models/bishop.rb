class Bishop < Piece
  after_initialize
  def make(color, x = nil, y = nil)
    super(color, true, "bishop", x, y)
  end

  def vectors
    [[1, 1], [-1, 1], [-1, -1], [1, -1]]
  end
end
