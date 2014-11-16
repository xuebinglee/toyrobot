require_relative '../spec_helper'
require 'parser'

class SampleTest < Minitest::Unit::TestCase
  def setup
    @p = Parser.new
  end

  def test_first_sample
    @p.parse 'PLACE 0,0,NORTH'
    @p.parse 'MOVE'
    lambda { @p.parse 'REPORT' }.must_output "0,1,NORTH\n"
  end

  def test_second_sample
    @p.parse 'PLACE 0,0,NORTH'
    @p.parse 'LEFT'
    lambda { @p.parse 'REPORT' }.must_output "0,0,WEST\n"
  end

  def test_third_sample
    @p.parse 'PLACE 1,2,EAST'
    @p.parse 'MOVE'
    @p.parse 'MOVE'
    @p.parse 'LEFT'
    @p.parse 'MOVE'
    lambda { @p.parse 'REPORT' }.must_output "3,3,NORTH\n"
  end
end
