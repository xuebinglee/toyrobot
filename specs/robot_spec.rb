require 'minitest/autorun'
require_relative 'spec_helper'
require 'board'
require 'robot'

describe Robot do
  before do
    @board = Board.new width: BOARD_WIDTH, height: BOARD_HEIGHT
    @robot = Robot.new(@board)
  end

  describe 'setup' do
    it 'knows the board that it\'s on' do
      @robot.board.must_equal @board
    end
  end

  let(:x_valid) { rand( 0..(BOARD_WIDTH - 1) ) }
  let(:y_valid) { rand( 0..(BOARD_HEIGHT - 1) ) }
  let(:x_invalid) { [rand(-99..-1), rand(BOARD_WIDTH..(BOARD_WIDTH + 99) )].sample }
  let(:y_invalid) { [rand(-99..-1), rand(BOARD_HEIGHT..(BOARD_HEIGHT + 99))].sample }
  let(:orientation_valid) { [:north, :east, :south, :west].sample }

  describe '#place_at' do
    describe 'when initially placed on board' do
      before do
        @robot.place_at x_valid, y_valid, orientation_valid
      end

      it 'has the correct X' do
        @robot.x.must_equal x_valid
      end

      it 'has the correct Y' do
        @robot.y.must_equal y_valid
      end

      it 'has the correct orientation' do
        @robot.orientation.must_equal orientation_valid
      end
    end

    describe 'when initially placed off board' do
      before do
        @robot.place_at x_invalid, y_invalid, orientation_valid
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

  describe '#report' do
    it 'returns nothing when robot is not placed' do
      @robot.report.must_be_nil
    end

    it 'returns nothing when robot is placed off board' do
      @robot.place_at x_invalid, y_invalid, orientation_valid
      lambda{ @robot.report }.must_be_silent
    end

    it 'returns current location and orientation when placed on board' do
      @robot.place_at x_valid, y_valid, orientation_valid
      lambda { @robot.report }.must_output "#{x_valid}, #{y_valid}, #{orientation_valid.upcase}\n"
    end
  end
end
