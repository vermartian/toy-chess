class ChessBoard

  attr_accessor :board, :squares

  def initialize
    @ranks = (1..8).to_a
    @files = ('A'..'H').to_a
    @squares = create_squares
    @board = new_board
  end

  def create_squares
    squares = []
    8.times do |i|
      row = []
      8.times { |j| row << Square.new([i, j]) }
      squares << row
    end
    squares
  end

  def new_board
    squares[0][0].piece = Rook.new(false, 0, 0)
    squares[0][7].piece = Rook.new(false, 0, 7)
    squares[0][1].piece = Knight.new(false, 0, 1)
    squares[0][6].piece = Knight.new(false, 0, 6)
    squares[0][2].piece = Bishop.new(false, 0, 2)
    squares[0][5].piece = Bishop.new(false, 0, 5)
    squares[0][3].piece = Queen.new(false, 0, 3)
    squares[0][4].piece = King.new(false, 0, 4)
    squares[7][0].piece = Rook.new(true, 7, 0)
    squares[7][7].piece = Rook.new(true, 7, 7)
    squares[7][1].piece = Knight.new(true, 7, 1)
    squares[7][6].piece = Knight.new(true, 7, 6)
    squares[7][2].piece = Bishop.new(true, 7, 2)
    squares[7][5].piece = Bishop.new(true, 7, 5)
    squares[7][3].piece = Queen.new(true, 7, 3)
    squares[7][4].piece = King.new(true, 7, 4)
    squares[1].each_with_index.map do |sq, col|
      sq.piece = Pawn.new(false, 1, col)
    end
    squares[6].each_with_index.map do |sq, col|
      sq.piece = Pawn.new(true, 7, col)
    end
    squares
  end
end

# white chess king	  ♔ U+2654	&#9812;
# white chess queen	  ♕	U+2655	&#9813;
# white chess rook	  ♖	U+2656	&#9814;
# white chess bishop	♗	U+2657	&#9815;
# white chess knight	♘	U+2658	&#9816;
# white chess pawn	  ♙	U+2659	&#9817;
# black chess king	  ♚	U+265A	&#9818;
# black chess queen	  ♛	U+265B	&#9819;
# black chess rook	  ♜	U+265C	&#9820;
# black chess bishop	♝	U+265D	&#9821;
# black chess knight	♞	U+265E	&#9822;
# black chess pawn	  ♟	U+265F	&#9823;
