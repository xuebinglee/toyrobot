require 'minitest/autorun'
require_relative 'spec_helper'
require 'robot'

describe Robot do
  before do
    @board = Board.new width: BOARD_WIDTH, height: BOARD_HEIGHT
    @robot = Robot.new(@board)
  end

  describe 'setup' do
    it 'should know the board that it\'s on' do
      @robot.board.must_equal @board
    end

    it 'should have geometry' do
      @robot.geometry.wont_be_nil
    end
  end

  let(:x_valid) { rand( 0...BOARD_WIDTH ) }
  let(:y_valid) { rand( 0...BOARD_HEIGHT) }
  let(:x_invalid) { [rand(-99..-1),
    rand(BOARD_WIDTH..(BOARD_WIDTH + 99) )].sample }
  let(:y_invalid) { [rand(-99..-1),
    rand(BOARD_HEIGHT..(BOARD_HEIGHT + 99))].sample }
  let(:orientation_valid) { ORIENTATIONS.sample }

  describe '#place_at' do
    describe 'when initially placed on board' do
      before do
        @robot.place_at x: x_valid, y: y_valid, orientation: orientation_valid
      end

      it 'should be on board' do
        @robot.geometry.on_board.must_equal true
      end

      it 'should have the correct value of X' do
        @robot.geometry.x.must_equal x_valid
      end

      it 'should have the correct value of Y' do
        @robot.geometry.y.must_equal y_valid
      end

      it 'should have the correct orientation' do
        @robot.geometry.orientation.must_equal orientation_valid
      end
    end

    describe 'when initially placed off board' do
      it 'should be off board when x is invalid' do
        @robot.place_at x: x_invalid, y: y_valid, orientation: orientation_valid
        @robot.geometry.on_board.must_equal false
      end

      it 'should be off board when Y is invalid' do
        @robot.place_at x: x_valid, y: y_invalid, orientation: orientation_valid
        @robot.geometry.on_board.must_equal false
      end
    end
  end

  describe '#report' do
    it 'should not print when robot is not placed' do
      lambda{ @robot.report }.must_be_silent
    end

    it 'should not print when robot is placed off board' do
      @robot.place_at x: x_invalid, y: y_invalid, orientation: orientation_valid
      lambda{ @robot.report }.must_be_silent
    end

    it 'should print current location and orientation when placed on board' do
      @robot.place_at x: x_valid, y: y_valid, orientation: orientation_valid
      lambda { @robot.report }.must_output
        "#{x_valid}, #{y_valid}, #{orientation_valid.upcase}\n"
    end
  end

  describe '#left' do
    it 'should turn to west when initially facing north' do
      @robot.place_at x: x_valid, y: y_valid, orientation: :north
      @robot.left
      @robot.geometry.orientation.must_equal :west
    end

    it 'should turn to south when initially facing west' do
      @robot.place_at x: x_valid, y: y_valid, orientation: :west
      @robot.left
      @robot.geometry.orientation.must_equal :south
    end

    it 'should turn to east when initially facing south' do
      @robot.place_at x: x_valid, y: y_valid, orientation: :south
      @robot.left
      @robot.geometry.orientation.must_equal :east
    end

    it 'should turn to north when initially facing east' do
      @robot.place_at x: x_valid, y: y_valid, orientation: :east
      @robot.left
      @robot.geometry.orientation.must_equal :north
    end
  end
end
