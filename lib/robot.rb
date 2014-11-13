require 'board'

class Robot
  attr_reader :board, :x, :y,:orientation

  def initialize(board)
    @board = board
  end

  # Set x as nil if x is invalid (negative or off board)
  def x=(x)
    case x
    when 0...@board.width
      @x = x
    else
      @x = nil
    end
  end

  # Set y as nil if y is invalid (negative or off board)
  def y=(y)
    case y
    when 0...@board.height
      @y = y
    else
      @y = nil
    end
  end

  # Set orientation as nil if orientation is invalid
  def orientation=(orientation)
    case orientation
    when :north, :east, :south, :west
      @orientation = orientation
    else
      @orientation = nil
    end
  end

  # Params
  #   X: an integer that is between 0 and (@board.width - 1)
  #   Y: an integer that is between 0 and (@board.height - 1)
  #   orientation: one of :north, :east, :south, and :west
  def place_at(x, y, orientation)
    self.x = x
    self.y = y
    self.orientation = orientation
  end

  # Returns X, Y, and orientation in upper case
  #   e.g. 1, 5, NORTH
  def report
    return if not_placed
    puts "#{@x}, #{@y}, #{@orientation.upcase}"
  end

  private
  # Robot is not placed on table if any of x, y, and orientation is nil
  def not_placed
    @x.nil? or @y.nil? or @orientation.nil?
  end
end
