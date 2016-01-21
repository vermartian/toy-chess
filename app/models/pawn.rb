class Pawn < Piece
  # attr_reader :color
  # attr_accessor :x, :y
  #
  # def initialize(color, type, x = nil, y = nil)
  #   super(color, :pawn, x, y)
  # end
  #
  # def vectors
  #   if color == :white
  #     unless y == 1
  #       return [[0, 1], [1, 1], [-1, 1]]
  #     end
  #     [[0, 1], [0, 2] [1, 1], [-1, 1]]
  #   else
  #     unless y == 6
  #       return [[0, -1], [0, 2], [-1, -1], [1, -1]]
  #     end
  #     [[0, -1], [-1, -1], [1, -1]]
  #   end
  # end
  #
  # def promotable?
  #   y == 7 && color == :white || y == 0 && color == :black
  # end
  #
  # def promote
  #   pro_type = params[:choice]
  #   pro_x = x
  #   pro_y = y
  #
  #   self.x = nil,
  #   self.y = nil,
  #   self.state "off"
  #   Piece.new(color: color, x: x, y: y, type: pro_type, state: 'on')
  # end
end
