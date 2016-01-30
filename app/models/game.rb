class Game < ActiveRecord::Base
  after_create :new_board!
  has_many :players, through: :gameplays
  has_many :pieces
  has_many :gameplays

  # def new_chess_board
  #   @chess_board = ChessBoard.new.new_board
  #   if self.id
  #     [0, 1, 6, 7].each do |row|
  #       (0..7).each do |col|
  #         @chess_board[row][col].game_id = self.id
  #       end
  #     end
  #   end
  #   @chess_board
  # end

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
    board[1].each_with_index.map do |sq, col|
      board[1][col] = Pawn.create(game_id: self.id, color: false, y: 1, x: col, sliding: false, state: "on")
    end
    board[6].each_with_index.map do |sq, col|
      board[6][col] = Pawn.create(game_id: self.id, color: true, y: 6, x: col, sliding: false, state: "on")
    end
    board
  end
end
