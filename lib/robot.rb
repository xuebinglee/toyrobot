class Robot
  attr_reader :board, :x, :y,:orientation

  def initialize(board)
    @board = board
  end

  def place_at(x, y, orientation)
    @x = x
    @y = y
    @orientation = orientation
  end
end
