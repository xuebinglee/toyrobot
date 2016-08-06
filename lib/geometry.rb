require_relative 'board'

class Geometry
  attr_reader :x, :y, :orientation
  attr_writer :orientation

  def initialize(board:, x:, y:, orientation:)
    @board, @x, @y, @orientation = board, x, y, orientation
    raise ArgumentError, 'Geometry is illegal' if illegal_x?(x) || illegal_y?(y)
  end

  def x=(new_x)
    return if illegal_x?(new_x)
    @x = new_x
  end

  def y=(new_y)
    return if illegal_y?(new_y)
    @y = new_y
  end

  private

  attr_reader :board

  def illegal_x?(x)
    x < 0 || x >= board.width
  end

  def illegal_y?(y)
    y < 0 || y >= board.height
  end
end
