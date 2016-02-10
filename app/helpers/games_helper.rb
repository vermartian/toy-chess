module GamesHelper
  FIG_COLORS = Hash[true, "b", false, "w"]
  FIG_TYPES = Hash["Bishop", "b", "King", "k", "Knight", "n", "Pawn", "p", "Queen", "q", "Rook", "r"]

  def figure
    "#{FIG_COLORS[self.color]}#{FIG_TYPES[self.type]}.svg"
  end

  def figuratize(game)
    board = @game.board
    gon.board = board
    piece_figs = []
    8.times do
      piece_figs <<  Array.new(8)
    end
    board.each_with_index do |row, i|
      row.each_with_index do |piece, col|
        if piece
          piece_figs[i][col] = ["#{piece.color}", piece.figure]
        end
      end
    end
    gon.figs = piece_figs
  end

  def fill_graves(game)
    b_dead_figs = []
    w_dead_figs = []
    b_dead_pieces = Piece.where(game: game, x: 8, color: true).order(updated_at: :asc)
    w_dead_pieces = Piece.where(game: game, x: 8, color: false).order(updated_at: :asc)
    b_dead_pieces.each do |piece|
      b_dead_figs << piece.figure
    end
    w_dead_pieces.each do |piece|
      w_dead_figs << piece.figure
    end
    gon.b_graves = b_dead_pieces
    gon.w_graves = w_dead_pieces
    gon.b_dead_figs = b_dead_figs
    gon.w_dead_figs = w_dead_figs
  end

  def player_color(game)
    gon.player_color = game.gameplays.where(player_id: current_player.id)[0].color
  end

  def diagonal_path(file, rank)
    xpos = x
    ypos = y
    steps = []
    file, rank = file.to_i, rank.to_i

    if file == xpos || rank == ypos
      return steps
    end

    delta_x = file > xpos ? 1 : -1
    delta_y = rank > ypos ? 1 : -1

    xpos += delta_x
    ypos += delta_y

    while (file - xpos).abs > 0 && (rank - ypos).abs > 0
      steps << [xpos, ypos]
      xpos += delta_x
      ypos += delta_y
    end
    steps
  end

  def square_path(file, rank)
    xpos = x
    ypos = y
    steps = []
    file, rank = file.to_i, rank.to_i

    if rank == ypos
      delta_x = file > xpos ? 1 : -1
      xpos += delta_x
      while (file - xpos).abs > 0
        steps << [xpos, ypos]
        xpos += delta_x
      end
    elsif file == xpos
      delta_y = rank > ypos ? 1 : -1
      ypos += delta_y
      while (rank - ypos).abs > 0
        steps << [xpos, ypos]
        ypos += delta_y
      end
    end
    steps
  end
end
