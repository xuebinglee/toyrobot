class Geometry
  attr_reader :x, :y, :orientation

  def off_board
    @x.nil? || @y.nil? || @orientation.nil?
  end

  def set(opts)
    @x = opts[:x]
    @y = opts[:y]
    @orientation = opts[:orientation]
  end
end
