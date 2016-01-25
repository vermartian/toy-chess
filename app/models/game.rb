class Game < ActiveRecord::Base
  has_many :players, through: :gameplays
  has_many :pieces

  default_scope { includes(:gameplays) }

  has_many :gameplays do
    def white
      self[0]
    end
    def black
      self[1]
    end
  end

  def chess_board
    @chess_board = ChessBoard.new.board
  end

  def self.begin!(white_player, black_player)
    players = [white_player, black_player]
    unless players && players.length == 2 && !players.include?(nil)
      raise ArgumentError
    end
    match = self.create
    match.gameplays << Gameplay.new(player_id: white_player.id, color: false)
    match.gameplays << Gameplay.new(player_id: black_player.id, color: true)
    match
  end
end
