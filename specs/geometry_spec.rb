require 'minitest/autorun'
require_relative 'spec_helper'
require 'geometry'

describe 'Geometry' do
  let(:x) { rand(BOARD_WIDTH) }
  let(:y) { rand(BOARD_HEIGHT)}
  let(:orientation) { ORIENTATIONS.sample }

  before do
    @board = Board.new width: BOARD_WIDTH, height: BOARD_HEIGHT
    @geometry = Geometry.new board: @board,
      x: x,
      y: y,
      orientation: orientation
  end

  it 'should have the correct value of x' do
    @geometry.x.must_equal x
  end

  it 'should have the correct value of y' do
    @geometry.y.must_equal y
  end

  it 'should have the correct orientation' do
    @geometry.orientation.must_equal orientation
  end
end
