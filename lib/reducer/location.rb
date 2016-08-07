require_relative 'validator'

module Reducer
  def location(state, action)
    case action.fetch(:type)
    when :move
      location = state.fetch(:location)
      new_state = case state.fetch(:orientation)
                  when :north
                    state.merge(
                      location: {
                        x: location.fetch(:x),
                        y: location.fetch(:y) + 1
                      }
                    )
                  when :east
                    state.merge(
                      location: {
                        x: location.fetch(:x) + 1,
                        y: location.fetch(:y)
                      }
                    )
                  when :south
                    state.merge(
                      location: {
                        x: location.fetch(:x),
                        y: location.fetch(:y) - 1
                      }
                    )
                  when :west
                    state.merge(
                      location: {
                        x: location.fetch(:x) - 1,
                        y: location.fetch(:y)
                      }
                    )
                  else
                    state
      end
      valid?(new_state) ? new_state : state
    else
      state
    end
  end
end
