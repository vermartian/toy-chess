class Square

  attr_accessor :color, :coordinates, :piece

  def initialize(coordinates = [0, 0], color = nil, piece = nil)
    @color = color
    @coordinates = coordinates
    @piece = piece
  end

end
