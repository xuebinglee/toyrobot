require_relative 'board'

class Geometry
  attr_reader :x, :y, :orientation

  def initialize(geometry = nil, overrides = {})
    @x = overrides[:x] || geometry.x
    @y = overrides[:y] || geometry.y
    @orientation = overrides[:orientation] || geometry.orientation
  end

  def valid?
    x_valid? && y_valid?
  end

  private

  def x_valid?
    x >= 0 && x < Board::WIDTH
  end

  def y_valid?
    y >= 0 && y < Board::HEIGHT
  end
end
