class Robot
  attr_reader :board, :x, :y,:orientation

  def initialize(board)
    @board = board
  end

  # Params
  #   X: an integer that is between 0 and (@board.width - 1)
  #   Y: an integer that is between 0 and (@board.height - 1)
  #   orientation: one of :north, :east, :south, and :west
  def place_at(x, y, orientation)
    # Ignore command if X and/or Y is too smll or too large
    return if x < 0 or x > (@board.width - 1)
    return if y < 0 or y > (@board.height - 1)
    @x = x
    @y = y
    @orientation = orientation
  end

  # Returns X, Y, and orientation in upper case
  #   e.g. 1, 5, NORTH
  def report
    return if not_placed
    "#{@x}, #{@y}, #{@orientation.upcase}"
  end

  private
  def not_placed
    @x.nil? or @y.nil? or @orientation.nil?
  end
end
