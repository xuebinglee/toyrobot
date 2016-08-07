require 'forwardable'
require_relative 'geometry'

class Robot
  extend Forwardable

  ORIENTATIONS = [:north, :east, :south, :west].freeze # in clockwise order

  def_delegators :geometry, :x, :y, :orientation

  def initialize
    @geometry = nil
  end

  def place_at(x:, y:, orientation:)
    new_geometry = Geometry.new(nil, x: x, y: y, orientation: orientation)
    @geometry = new_geometry if new_geometry.valid?
  end

  def turn_left
    return unless placed?
    # index of previous direction in clockwise ORIENTATIONS
    i = ORIENTATIONS.index(geometry.orientation) - 1
    @geometry = Geometry.new(geometry, orientation: ORIENTATIONS[i])
  end

  def turn_right
    return unless placed?
    # index of next direction in clockwise ORIENTATIONS
    i = (ORIENTATIONS.index(geometry.orientation) + 1) % ORIENTATIONS.length
    @geometry = Geometry.new(geometry, orientation: ORIENTATIONS[i])
  end

  def move
    return unless placed?
    new_geometry = case geometry.orientation
    when :north
      Geometry.new(geometry, y: geometry.y + 1)
    when :south
      Geometry.new(geometry, y: geometry.y - 1)
    when :east
      Geometry.new(geometry, x: geometry.x + 1)
    when :west
      Geometry.new(geometry, x: geometry.x - 1)
    end
    @geometry = new_geometry if new_geometry.valid?
  end

  def report
    return unless placed?
    puts "#{geometry.x},#{geometry.y},#{geometry.orientation.upcase}"
  end

  def placed?
    !geometry.nil?
  end

  private

  attr_reader :geometry
end
