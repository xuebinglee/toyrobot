require 'board'
require 'geometry'

class Robot
  attr_reader :geometry

  def initialize(board)
    @board = board
    @geometry = Geometry.new
  end

  def place_at(opts)
    # Ignore command unless
    return unless (0...@board.width).cover?(opts[:x]) && # x is valid and
      (0...@board.height).cover?(opts[:y]) # y is valid
    @geometry.set x: opts[:x], y: opts[:y], orientation: opts[:orientation]
  end

  def turn_left
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

  def turn_right
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
      @geometry.set y: (@geometry.y + 1) if (@geometry.y + 1) < @board.height
    when :south
      @geometry.set y: (@geometry.y - 1) if (@geometry.y - 1) >= 0
    when :east
      @geometry.set x: (@geometry.x + 1) if (@geometry.x + 1) < @board.width
    when :west
      @geometry.set x: (@geometry.x - 1) if (@geometry.x - 1) >= 0
    end
  end

  def report
    return unless @geometry.on_board
    puts "#{@geometry.x},#{@geometry.y},#{@geometry.orientation.upcase}"
  end
end
