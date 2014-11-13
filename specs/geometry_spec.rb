require 'minitest/autorun'
require_relative 'spec_helper'
require 'geometry'

describe 'Geometry' do
  let(:geometry) { Geometry.new }

  it 'is off board when created' do
    geometry.on_board.must_equal false
  end

  describe 'when asked to change' do
    let(:x) { rand(BOARD_WIDTH) }
    let(:y) { rand(BOARD_HEIGHT)}
    let(:orientation) { [:north, :east, :south, :west].sample }

    before do
      geometry.set x: x, y: y, orientation: orientation
    end

    it 'is on board' do
      geometry.on_board.must_equal true
    end

    it 'has the correct value of x' do
      geometry.x.must_equal x
    end

    it 'has the correct value of y' do
      geometry.y.must_equal y
    end

    it 'has the correct orientation' do
      geometry.orientation.must_equal orientation
    end
  end
end
