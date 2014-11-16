require_relative 'geometry'

class Robot
  attr_reader :geometry

  def initialize(board)
    @board = board
  end

  def place_at(opts)
    begin
      @geometry = Geometry.new board: @board,
        x: opts[:x],
        y: opts[:y],
        orientation: opts[:orientation]
    rescue ArgumentError # Geometry is off board
      @geometry = nil
    end
  end

  def turn_left
    return unless @geometry # Ignore command unless robot is properly placed
    @geometry.orientation =
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
  end

  def turn_right
    return unless @geometry # Ignore command unless robot is properly placed
    @geometry.orientation =
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
  end

  def move
    return unless @geometry # Ignore command unless robot is properly placed
    case @geometry.orientation
    when :north
      @geometry.y += 1
    when :south
      @geometry.y -= 1
    when :east
      @geometry.x += 1
    when :west
      @geometry.x -= 1
    end
  end

  def report
    return unless @geometry # Ignore command unless robot is properly placed
    puts "#{@geometry.x},#{@geometry.y},#{@geometry.orientation.upcase}"
  end
end
