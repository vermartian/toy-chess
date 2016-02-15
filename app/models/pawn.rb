class Pawn < Piece

  def vectors
    if color == false
      vectors = [[0, 1]]
      if y == 1
        vectors << [0, 2]
      end
      if game.piece_at?(x + 1, y + 1) && game.piece_at(x + 1, y + 1).color
        vectors << [1, 1]
      end
      if game.piece_at?(x - 1, y + 1) && game.piece_at(x - 1, y + 1).color
        vectors << [-1, 1]
      end
    else
      vectors = [[0, -1]]
      if y == 6
        vectors << [0, -2]
      end
      if game.piece_at?(x - 1, y - 1) && !game.piece_at(x - 1, y - 1).color
        vectors << [-1, -1]
      end
      if game.piece_at?(x + 1, y - 1) && !game.piece_at(x + 1, y - 1).color
        vectors << [1, -1]
      end
    end
    vectors
  end

  def promotable?
    y == 7 && color == false || y == 0 && color == true
  end

  def promote
    pro_type = params[:choice]
    pro_x = x
    pro_y = y
    pro_game = game_id
    pro_player = player_id
    self.update_attributes(x: nil, y: nil, state: "promoted")
    Piece.new(color: color, x: pro_x, y: pro_y, type: pro_type, state: 'on')
  end
end
