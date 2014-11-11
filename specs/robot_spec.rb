require 'minitest/autorun'
require_relative 'spec_helper'
require 'board'
require 'robot'

describe Robot do
  before do
    @board = Board.new(BOARD_WIDTH, BOARD_HEIGHT)
    @robot = Robot.new(@board)
  end

  describe 'setup' do
    it 'knows the board that it\'s on' do
      @robot.board.must_equal @board
    end
  end

  describe '#place_at' do
    let(:orientation) { [:north, :east, :south, :west].sample }
    describe 'when initially placed on board' do
      before do
        @x = rand( 0..(BOARD_WIDTH - 1) )
        @y = rand( 0..(BOARD_HEIGHT - 1) )
        @robot.place_at @x, @y, orientation
      end

      it 'has the correct X' do
        @robot.x.must_equal @x
      end

      it 'has the correct Y' do
        @robot.y.must_equal @y
      end

      it 'has the correct orientation' do
        @robot.orientation.must_equal orientation
      end
    end

    describe 'when initially placed off board' do
      before do
        @x = [rand(-99..-1), rand(BOARD_WIDTH..99 )].sample
        @y = [rand(-99..-1), rand(BOARD_HEIGHT..99)].sample
        @robot.place_at @x, @y, orientation
      end

      it 'has no X' do
        @robot.x.must_be_nil
      end

      it 'has no Y' do
        @robot.y.must_be_nil
      end

      it 'has no orientation' do
        @robot.orientation.must_be_nil
      end
    end

    describe 'when placed with invalid attributes' do
      it 'raises ArgumentError' do
        skip 'TODO'
      end
    end
  end
end
