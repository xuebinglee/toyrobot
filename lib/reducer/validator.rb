require_relative '../board'

module Reducer
  def valid?(state)
    x_valid?(state) && y_valid?(state)
  end

  def x_valid?(state)
    x = state.fetch(:location).fetch(:x)
    x >= 0 && x < Board::WIDTH
  end

  def y_valid?(state)
    y = state.fetch(:location).fetch(:y)
    y >= 0 && y < Board::HEIGHT
  end
end
