class King < Piece
  # attr_reader :color, :sliding, :type
  # attr_accessor :x, :y, :state
  #
  # def initialize(color, type, x = nil, y = nil)
  #   super(color, :king, x, y)
  # end
  #
  # def vectors
  #   v = [[1, 1], [-1, 1], [-1, -1], [1, -1], [1, 0], [0, 1], [-1, 0], [0, -1]]
  #   if self.can_castle?
  #     v << [2, 0]
  #     v << [-2, 0]
  #   end
  #   v
  # end
end
