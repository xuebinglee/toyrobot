class Board
  attr_reader :width, :height

  def initialize(opts)
    @width  = opts[:width]  || 5
    @height = opts[:height] || 5
  end
end
