class Rook < Piece
  # after_initialize :make

  def self.make(color, x = nil, y = nil)
    super(color, true, "rook", x, y)
  end

  def vectors
    [[1, 0], [0, 1], [-1, 0], [0, -1]]
  end
end
