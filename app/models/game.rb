class Game < ApplicationRecord
  after_create :new_board!

  has_many :players, through: :gameplays
  has_many :pieces
  has_many :gameplays

  def board
    board =[]
    8.times do
      board <<  Array.new(8)
    end
    pieces.each do |piece|
      unless piece.x == 8
        board[piece.y][piece.x] = piece
      end
    end
    board
  end

  def turn?
    if turn % 2 == 0
      true
    else
      false
    end
  end

  def piece_at(x, y)
    pieces.where(x: x, y: y).last
  end

  def piece_at?(x, y)
    piece_at(x, y) ? true : false
  end

  def check?(color)
    king = king(color)
    pieces_inplay(!color).each do |pc|
      if pc.move_capable?(king.x, king.y)
        unless pc.blocked?(king.x, king.y)
          @assassin = pc
          return true
        end
      end
    end
    false
  end

  def checkmate?(color)
    unless check?(color)
      return false
    end
    king = king(color)
    pieces_inplay(color).each do |pc|
      if pc.move_capable?(@assassin.x, @assassin.y)
        unless pc.blocked?(@assassin.x, @assassin.y)
          # if !check_causing_move
          return false
        end
      elsif @assassin.sliding && !@assassin.paths(king.x, king.y).empty?
        @assassin.paths(king.x, king.y).each do |sq|
          if pc.move_capable?(sq[0], sq[1])
            unless pc.blocked?(sq[0], sq[1])
              # if !check_causing_move
              return false
            end
          end
        end
      elsif king.escape?
        return false
      end
    end
    true
  end

  def pieces_inplay(color)
    pieces.where(color: color).where.not(state: "off")
  end

  def king(color)
    pieces.find_by(type: 'King', color: color)
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
