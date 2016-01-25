class Pawn < Piece
  # after_initialize
  def make(color, x = nil, y = nil)
    super(color, false, "pawn", x, y)
  end

  def vectors
    if @color == false
      vectors = [[0, 1], [1, 1], [-1, 1]]
      if @y == 1
        vectors << [0, 2]
      end
    else
      vectors = [[0, -1], [-1, -1], [1, -1]]
      if @y == 6
        vectors << [0, -2]
      end
    end
    vectors
  end

  def promotable?
    y == 7 && color == :white || y == 0 && color == :black
  end

  def promote
    pro_type = params[:choice]
    pro_x = x
    pro_y = y

    self.x = nil
    self.y = nil
    self.state "off"
    Piece.new(color: color, x: x, y: y, type: pro_type, state: 'on')
  end
end
