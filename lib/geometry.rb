require 'board'

class Geometry
  attr_reader :x, :y, :orientation
  attr_writer :orientation

  def initialize(opts)
    @board = opts[:board]
    @x = opts[:x]
    @y = opts[:y]
    @orientation = opts[:orientation]
    unless (0...@board.width).cover?(@x) && # x is valid and
           (0...@board.height).cover?(@y) # y is valid
      raise ArgumentError, 'Geometry is off board'
    end
  end

  def x=(x)
    return unless (0...@board.width).cover? x
    @x = x
  end

  def y=(y)
    return unless (0...@board.height).cover? y
    @y = y
  end
end
