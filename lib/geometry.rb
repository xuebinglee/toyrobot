require_relative 'board'

class Geometry
  attr_reader :x, :y, :orientation

  def initialize(geometry = nil, overrides = {})
    @x = overrides[:x] || geometry.x
    @y = overrides[:y] || geometry.y
    @orientation = overrides[:orientation] || geometry.orientation
  end

  def valid?(board)
    x_valid?(board.width) && y_valid?(board.height)
  end

  private

  def x_valid?(board_width)
    x >= 0 && x < board_width
  end

  def y_valid?(board_height)
    y >= 0 && y < board_height
  end
end
