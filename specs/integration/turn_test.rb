require_relative '../spec_helper'
require 'parser'

class MoveTest < Minitest::Unit::TestCase
  def setup
    robot = Robot.build
    @p = Parser.new robot: robot
  end

  def test_turn_360_degrees_anticlockwise
    @p.parse 'PLACE 2,4,NORTH'
    @p.parse 'LEFT'
    @p.parse 'LEFT'
    @p.parse 'LEFT'
    @p.parse 'LEFT'
    lambda { @p.parse 'REPORT' }.must_output "2,4,NORTH\n"
  end

  def test_turn_360_degrees_clockwise
    @p.parse 'PLACE 2,4,NORTH'
    @p.parse 'RIGHT'
    @p.parse 'RIGHT'
    @p.parse 'RIGHT'
    @p.parse 'RIGHT'
    lambda { @p.parse 'REPORT' }.must_output "2,4,NORTH\n"
  end
end
