require_relative '../spec_helper'
require 'parser'

class MoveTest < Minitest::Test
  def setup
    robot = Robot.build
    @p = Parser.new robot: robot
  end

  def test_not_fall_from_top_edge
    @p.parse 'PLACE 2,4,NORTH'
    @p.parse 'MOVE'
    -> { @p.parse 'REPORT' }.must_output "2,4,NORTH\n"
  end

  def test_not_fall_from_bottom_edge
    @p.parse 'PLACE 2,0,SOUTH'
    @p.parse 'MOVE'
    -> { @p.parse 'REPORT' }.must_output "2,0,SOUTH\n"
  end

  def test_not_fall_from_left_edge
    @p.parse 'PLACE 0,2,WEST'
    @p.parse 'MOVE'
    -> { @p.parse 'REPORT' }.must_output "0,2,WEST\n"
  end

  def test_not_fall_from_right_edge
    @p.parse 'PLACE 4,2,EAST'
    @p.parse 'MOVE'
    -> { @p.parse 'REPORT' }.must_output "4,2,EAST\n"
  end

  def test_walk_in_a_circle_on_edge_anticlockwise
    @p.parse 'PLACE 0,0,NORTH'
    @p.parse 'RIGHT'
    @p.parse 'MOVE'
    @p.parse 'MOVE'
    @p.parse 'MOVE'
    @p.parse 'MOVE'
    @p.parse 'LEFT'
    @p.parse 'MOVE'
    @p.parse 'MOVE'
    @p.parse 'MOVE'
    @p.parse 'MOVE'
    @p.parse 'LEFT'
    @p.parse 'MOVE'
    @p.parse 'MOVE'
    @p.parse 'MOVE'
    @p.parse 'MOVE'
    @p.parse 'LEFT'
    @p.parse 'MOVE'
    @p.parse 'MOVE'
    @p.parse 'MOVE'
    @p.parse 'MOVE'
    -> { @p.parse 'REPORT' }.must_output "0,0,SOUTH\n"
  end

  def test_walk_in_a_circle_on_edge_clockwise
    @p.parse 'PLACE 0,0,NORTH'
    @p.parse 'MOVE'
    @p.parse 'MOVE'
    @p.parse 'MOVE'
    @p.parse 'MOVE'
    @p.parse 'RIGHT'
    @p.parse 'MOVE'
    @p.parse 'MOVE'
    @p.parse 'MOVE'
    @p.parse 'MOVE'
    @p.parse 'RIGHT'
    @p.parse 'MOVE'
    @p.parse 'MOVE'
    @p.parse 'MOVE'
    @p.parse 'MOVE'
    @p.parse 'RIGHT'
    @p.parse 'MOVE'
    @p.parse 'MOVE'
    @p.parse 'MOVE'
    @p.parse 'MOVE'
    -> { @p.parse 'REPORT' }.must_output "0,0,WEST\n"
  end
end
