module Reducer
  ORIENTATIONS = [:north, :east, :south, :west].freeze # in clockwise order

  def orientation(state, action)
    return if state.nil?
    case action.fetch(:type)
    when :left
      idx = ORIENTATIONS.index(state) - 1
      ORIENTATIONS[idx]
    when :right
      idx = (ORIENTATIONS.index(state) + 1) % 4
      ORIENTATIONS[idx]
    else
      state
    end
  end
end
