class Board < Struct.new(:width, :height)
  def initialize(width = 5, height = 5)
    super
  end
end
