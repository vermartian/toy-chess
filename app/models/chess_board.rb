class ChessBoard
  include GamesHelper
  attr_accessor :board

  def initialize
    @board = blank
  end

  def blank
    board =[]
    8.times do
      board <<  Array.new(8)
    end
    board
  end

  def new_board
    board =[]
    8.times do
      board <<  Array.new(8)
    end
    board[0][0] = Rook.new(color: false, y: 0, x: 0, sliding: true, state: "on")
    board[0][7] = Rook.new(color: false, y: 0, x: 7, sliding: true, state: "on")
    board[0][1] = Knight.new(color: false, y: 0, x: 1, sliding: false, state: "on")
    board[0][6] = Knight.new(color: false, y: 0, x: 6, sliding: false, state: "on")
    board[0][2] = Bishop.new(color: false, y: 0, x: 2, sliding: true, state: "on")
    board[0][5] = Bishop.new(color: false, y: 0, x: 5, sliding: true, state: "on")
    board[0][3] = Queen.new(color: false, y: 0, x: 3, sliding: true, state: "on")
    board[0][4] = King.new(color: false, y: 0, x: 4, sliding: false, state: "on")
    board[7][0] = Rook.new(color: true, y: 7, x: 0, sliding: true, state: "on")
    board[7][7] = Rook.new(color: true, y: 7, x: 7, sliding: true, state: "on")
    board[7][1] = Knight.new(color: true, y: 7, x: 1, sliding: false, state: "on")
    board[7][6] = Knight.new(color: true, y: 7, x: 6, sliding: false, state: "on")
    board[7][2] = Bishop.new(color: true, y: 7, x: 2, sliding: true, state: "on")
    board[7][5] = Bishop.new(color: true, y: 7, x: 5, sliding: true, state: "on")
    board[7][3] = Queen.new(color: true, y: 7, x: 3, sliding: true, state: "on")
    board[7][4] = King.new(color: true, y: 7, x: 4, sliding: false, state: "on")
    board[1].each_with_index.map do |sq, col|
      board[1][col] = Pawn.new(color: false, y: 1, x: col, sliding: false, state: "on")
    end
    board[6].each_with_index.map do |sq, col|
      board[6][col] = Pawn.new(color: true, y: 6, x: col, sliding: false, state: "on")
    end
    board
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
