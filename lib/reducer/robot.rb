require_relative 'validator'
require_relative 'location'
require_relative 'orientation'

module Reducer
  INITIAL_STATE = {
    location: { x: nil, y: nil },
    orientation: nil
  }.freeze

  def robot(state, action)
    case action.fetch(:type)
    when :place
      new_location = action.fetch(:location)
      new_state = {
        location: { x: new_location.fetch(:x), y: new_location.fetch(:y) },
        orientation: action.fetch(:orientation)
      }
      valid?(new_state) ? new_state : state
    when :move
      state.merge(location(state, action))
    when :left, :right
      state.merge(orientation: orientation(state.fetch(:orientation), action))
    when :report
      location = state.fetch(:location)
      puts "#{location.fetch(:x)},#{location.fetch(:y)},#{state.fetch(:orientation).upcase}"
      state
    else
      state
    end
  end
end
