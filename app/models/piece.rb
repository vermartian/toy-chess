class Piece < ActiveRecord::Base
  belongs_to :player
  belongs_to :game
  include GamesHelper
  
  def vectors(vectors = [])
    @vectors ||= vectors
  end

  def move(position)
    if self.move_capable?(position)
      @x = position[0]
      @y = position[1]
    else
      # snapback
    end
  end

  def self.move_capable?(target)
    vector = [target[0] - self.x, target[1] - self.y]
    if vector == [0,0]
      return false
    end
    unless sliding
      return vectors.include?(vector)
    end
    vectors.each do |v|
      (1..8).each do |squares|
        if vector == [v[0]*squares, v[1]*squares]
          return true
        end
      end
    end
    false
  end

  def chess_board_coords?(coordinates)
    coordinates[0].between?(0, 7) && coordinates[1].between?(0, 7)
  end

  def opponent_color
    @color == false ? true : false
  end
end
