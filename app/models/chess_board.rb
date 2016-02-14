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
    (0..7).each do |col|
      board[1][col] = Pawn.new(color: false, y: 1, x: col, sliding: false, state: "on")
      board[6][col] = Pawn.new(color: true, y: 6, x: col, sliding: false, state: "on")
    end
    board
  end
end
