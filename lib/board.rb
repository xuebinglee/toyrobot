class Board
  DEFAULT_WIDTH  = 5
  DEFAULT_HEIGHT = 5

  attr_reader :width, :height

  def initialize(opts = {})
    @width  = opts[:width]  || DEFAULT_WIDTH
    @height = opts[:height] || DEFAULT_HEIGHT
  end
end
