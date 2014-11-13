class Geometry
  attr_reader :x, :y, :orientation

  def on_board
    # On board when none is nil
    (@x != nil) && (@y != nil) && (@orientation != nil)
  end

  def set(opts)
    @x = opts[:x]
    @y = opts[:y]
    @orientation = opts[:orientation]
  end
end
