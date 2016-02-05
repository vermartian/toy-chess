class Piece < ActiveRecord::Base
  include GamesHelper
  belongs_to :player
  belongs_to :game

  def vectors(vectors = [])
    @vectors ||= vectors
  end

  def move(x, y)
    if self.move_capable?(position)
      @x = x
      @y = y
    end
  end

  def move_capable?(file, rank)
    vector = [file.to_i - x, rank.to_i - y]
    if vector == [0,0]
      return false
    end
    unless sliding
      return vectors.include?(vector)
    end
    vectors.each do |v|
      (1..8).each do |squares|
        if vector == [v[0] * squares, v[1] * squares]
          return true
        end
      end
    end
    false
  end
end
