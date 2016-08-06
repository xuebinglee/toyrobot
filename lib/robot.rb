require_relative 'board'
require_relative 'geometry'

class Robot
  ORIENTATIONS = [:north, :east, :south, :west].freeze # in clockwise order

  attr_reader :geometry

  def initialize(board:)
    @board = board
  end

  def place_at(x:, y:, orientation:)
    @geometry = Geometry.new(board: board,
                             x: x,
                             y: y,
                             orientation: orientation)
  rescue ArgumentError # Geometry is illegal
    @geometry = nil
  end

  def turn_left
    return unless geometry # Ignore command unless robot is properly placed
    # index of previous direction in clockwise ORIENTATIONS
    i = ORIENTATIONS.index(geometry.orientation) - 1
    @geometry.orientation = ORIENTATIONS[i]
  end

  def turn_right
    return unless geometry # Ignore command unless robot is properly placed
    # index of next direction in clockwise ORIENTATIONS
    # Left shift index by 4 so that it doesn't reach 4 which is illegal
    i = ORIENTATIONS.index(geometry.orientation) + 1 - 4
    @geometry.orientation = ORIENTATIONS[i]
  end

  def move
    return unless geometry # Ignore command unless robot is properly placed
    case geometry.orientation
    when :north
      @geometry.y = geometry.y + 1
    when :south
      @geometry.y = geometry.y - 1
    when :east
      @geometry.x = geometry.x + 1
    when :west
      @geometry.x = geometry.x - 1
    end
  end

  def report
    return unless geometry # Ignore command unless robot is properly placed
    puts "#{geometry.x},#{geometry.y},#{geometry.orientation.upcase}"
  end

  private

  attr_reader :board
end
