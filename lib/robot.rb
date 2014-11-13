require 'board'

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
    # Ignore command if X and/or Y is negative or off board
    return unless (0...@board.width).cover? x
    return unless (0...@board.height).cover? y
    @x = x
    @y = y
    @orientation = orientation
  end

  # Returns X, Y, and orientation in upper case
  #   e.g. 1, 5, NORTH
  def report
    return if not_placed
    puts "#{@x}, #{@y}, #{@orientation.upcase}"
  end

  private
  def not_placed
    @x.nil? or @y.nil? or @orientation.nil?
  end
end
