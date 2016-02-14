class Game < ActiveRecord::Base
  after_create :new_board!

  has_many :players, through: :gameplays
  has_many :pieces
  has_many :gameplays

  def board
    board =[]
    8.times do
      board <<  Array.new(8)
    end
    pieces = self.pieces
    pieces.each do |piece|
      unless piece.x == 8
        board[piece.y][piece.x] = piece
      end
    end
    board
  end

  def turn?
    if self.turn % 2 == 0
      true
    else
      false
    end
  end

  def piece_at(x, y)
    self.pieces.where(x: x, y: y).last
  end

  def piece_at?(x, y)
    piece_at(x, y) ? true : false
  end

private

  def new_board!
    board =[]
    8.times do
      board <<  Array.new(8)
    end
    board[0][0] = Rook.create(game_id: self.id, color: false, y: 0, x: 0, sliding: true, state: "on")
    board[0][7] = Rook.create(game_id: self.id, color: false, y: 0, x: 7, sliding: true, state: "on")
    board[0][1] = Knight.create(game_id: self.id, color: false, y: 0, x: 1, sliding: false, state: "on")
    board[0][6] = Knight.create(game_id: self.id, color: false, y: 0, x: 6, sliding: false, state: "on")
    board[0][2] = Bishop.create(game_id: self.id, color: false, y: 0, x: 2, sliding: true, state: "on")
    board[0][5] = Bishop.create(game_id: self.id, color: false, y: 0, x: 5, sliding: true, state: "on")
    board[0][3] = Queen.create(game_id: self.id, color: false, y: 0, x: 3, sliding: true, state: "on")
    board[0][4] = King.create(game_id: self.id, color: false, y: 0, x: 4, sliding: false, state: "on")
    board[7][0] = Rook.create(game_id: self.id, color: true, y: 7, x: 0, sliding: true, state: "on")
    board[7][7] = Rook.create(game_id: self.id, color: true, y: 7, x: 7, sliding: true, state: "on")
    board[7][1] = Knight.create(game_id: self.id, color: true, y: 7, x: 1, sliding: false, state: "on")
    board[7][6] = Knight.create(game_id: self.id, color: true, y: 7, x: 6, sliding: false, state: "on")
    board[7][2] = Bishop.create(game_id: self.id, color: true, y: 7, x: 2, sliding: true, state: "on")
    board[7][5] = Bishop.create(game_id: self.id, color: true, y: 7, x: 5, sliding: true, state: "on")
    board[7][3] = Queen.create(game_id: self.id, color: true, y: 7, x: 3, sliding: true, state: "on")
    board[7][4] = King.create(game_id: self.id, color: true, y: 7, x: 4, sliding: false, state: "on")
    (0..7).each do |col|
      board[1][col] = Pawn.create(game_id: self.id, color: false, y: 1, x: col, sliding: false, state: "on")
      board[6][col] = Pawn.create(game_id: self.id, color: true, y: 6, x: col, sliding: false, state: "on")
    end
    board
  end
end
