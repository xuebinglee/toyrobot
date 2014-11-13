require 'board'
require 'geometry'

class Robot
  attr_reader :board, :geometry

  def initialize(board)
    @board = board
    @geometry = Geometry.new
  end

  # Params
  #   X: an integer that is between 0 and (@board.width - 1)
  #   Y: an integer that is between 0 and (@board.height - 1)
  #   orientation: one of :north, :east, :south, and :west
  def place_at(opts)
    # Ignore command unless
    return unless (0...@board.width).cover?(opts[:x]) && # x is valid and
      (0...@board.height).cover?(opts[:y]) # y is valid
    @geometry.set x: opts[:x], y: opts[:y], orientation: opts[:orientation]
  end

  def left
    orientation =
      case @geometry.orientation
      when :north
        :west
      when :west
        :south
      when :south
        :east
      when :east
        :north
      end
    @geometry.set orientation: orientation
  end

  def right
    orientation =
    case @geometry.orientation
    when :north
      :east
    when :east
      :south
    when :south
      :west
    when :west
      :north
    end
    @geometry.set orientation: orientation
  end

  def move
    case @geometry.orientation
    when :north
      @geometry.set y: (@geometry.y + 1)
    when :south
      @geometry.set y: (@geometry.y - 1)
    when :east
      @geometry.set x: (@geometry.x + 1)
    when :west
      @geometry.set x: (@geometry.x - 1)
    end
  end

  # Returns X, Y, and orientation in upper case
  #   e.g. 1, 5, NORTH
  def report
    return unless @geometry.on_board
    puts "#{@geometry.x}, #{@geometry.y}, #{@geometry.orientation.upcase}"
  end
end
