class Robot
  attr_reader :board, :x, :y,:orientation

  def initialize(board)
    @board = board
  end

  def place_at(x, y, orientation)
    return if x < 0 or x > (@board.width - 1)
    return if y < 0 or y > (@board.height - 1)
    @x = x
    @y = y
    @orientation = orientation
  end
end
