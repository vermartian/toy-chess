module GamesHelper
  FIG_COLORS = Hash[true, "b", false, "w"]
  FIG_TYPES = Hash["Bishop", "b", "King", "k", "Knight", "n", "Pawn", "p", "Queen", "q", "Rook", "r"]

  def figure
    "#{FIG_COLORS[self.color]}#{FIG_TYPES[self.type]}.svg"
  end

  def figuratize(new_board)
    piece_rows = [new_board[0], new_board[1], new_board[6], new_board[7]]
    piece_figs = []
    piece_rows.each do |row|
      row.each do |piece|
        piece_figs << piece.figure
      end
    end
    piece_figs
  end
end
