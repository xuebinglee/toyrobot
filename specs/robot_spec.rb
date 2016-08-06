require_relative 'spec_helper'
require 'robot'

describe Robot do
  before do
    @board = Board.new(BOARD_WIDTH, BOARD_HEIGHT)
    @robot = Robot.new(board: @board)
  end

  let(:x_valid) { rand(0...BOARD_WIDTH) }
  let(:y_valid) { rand(0...BOARD_HEIGHT) }
  let(:x_invalid) do
    [rand(-99..-1),
     rand(BOARD_WIDTH..(BOARD_WIDTH + 99))].sample
  end
  let(:y_invalid) do
    [rand(-99..-1),
     rand(BOARD_HEIGHT..(BOARD_HEIGHT + 99))].sample
  end
  let(:orientation_valid) { ORIENTATIONS.sample }

  describe '#place_at' do
    describe 'when initially placed on board' do
      before do
        @robot.place_at x: x_valid, y: y_valid, orientation: orientation_valid
      end

      it 'should be on board' do
        @robot.send(:geometry).wont_be_nil
      end

      it 'should have the correct value of X' do
        @robot.x.must_equal x_valid
      end

      it 'should have the correct value of Y' do
        @robot.y.must_equal y_valid
      end

      it 'should have the correct orientation' do
        @robot.orientation.must_equal orientation_valid
      end
    end

    describe 'when initially placed off board' do
      it 'should be off board when x is invalid' do
        @robot.place_at x: x_invalid, y: y_valid, orientation: orientation_valid
        @robot.send(:geometry).must_be_nil
      end

      it 'should be off board when Y is invalid' do
        @robot.place_at x: x_valid, y: y_invalid, orientation: orientation_valid
        @robot.send(:geometry).must_be_nil
      end
    end
  end

  describe '#report' do
    it 'should not print when robot is not placed' do
      -> { @robot.report }.must_be_silent
    end

    it 'should not print when robot is placed off board' do
      @robot.place_at x: x_invalid, y: y_invalid, orientation: orientation_valid
      -> { @robot.report }.must_be_silent
    end

    it 'should print current location and orientation when placed on board' do
      @robot.place_at x: x_valid, y: y_valid, orientation: orientation_valid
      -> { @robot.report }.must_output
      "#{x_valid},#{y_valid},#{orientation_valid.upcase}\n"
    end
  end

  describe '#left' do
    it 'should turn to west when initially facing north' do
      @robot.place_at x: x_valid, y: y_valid, orientation: :north
      @robot.turn_left
      @robot.orientation.must_equal :west
    end

    it 'should turn to south when initially facing west' do
      @robot.place_at x: x_valid, y: y_valid, orientation: :west
      @robot.turn_left
      @robot.orientation.must_equal :south
    end

    it 'should turn to east when initially facing south' do
      @robot.place_at x: x_valid, y: y_valid, orientation: :south
      @robot.turn_left
      @robot.orientation.must_equal :east
    end

    it 'should turn to north when initially facing east' do
      @robot.place_at x: x_valid, y: y_valid, orientation: :east
      @robot.turn_left
      @robot.orientation.must_equal :north
    end
  end

  describe '#right' do
    it 'should turn to west when initially facing south' do
      @robot.place_at x: x_valid, y: y_valid, orientation: :south
      @robot.turn_right
      @robot.orientation.must_equal :west
    end

    it 'should turn to south when initially facing east' do
      @robot.place_at x: x_valid, y: y_valid, orientation: :east
      @robot.turn_right
      @robot.orientation.must_equal :south
    end

    it 'should turn to east when initially facing north' do
      @robot.place_at x: x_valid, y: y_valid, orientation: :north
      @robot.turn_right
      @robot.orientation.must_equal :east
    end

    it 'should turn to north when initially facing west' do
      @robot.place_at x: x_valid, y: y_valid, orientation: :west
      @robot.turn_right
      @robot.orientation.must_equal :north
    end
  end

  describe '#move' do
    describe 'when asked to move on board' do
      let(:x_inland) { rand(1...(BOARD_WIDTH - 1)) }
      let(:y_inland) { rand(1...(BOARD_HEIGHT - 1)) }

      it 'should move in the right direction when facing north' do
        @robot.place_at x: x_inland, y: y_inland, orientation: :north
        @robot.move
        @robot.x.must_equal x_inland
        @robot.y.must_equal(y_inland + 1)
      end

      it 'should move in the right direction when facing east' do
        @robot.place_at x: x_inland, y: y_inland, orientation: :east
        @robot.move
        @robot.x.must_equal(x_inland + 1)
        @robot.y.must_equal y_inland
      end

      it 'should move in the right direction when facing south' do
        @robot.place_at x: x_inland, y: y_inland, orientation: :south
        @robot.move
        @robot.x.must_equal x_inland
        @robot.y.must_equal(y_inland - 1)
      end

      it 'should move in the right direction when facing west' do
        @robot.place_at x: x_inland, y: y_inland, orientation: :west
        @robot.move
        @robot.x.must_equal(x_inland - 1)
        @robot.y.must_equal y_inland
      end
    end

    describe 'when asked to move off board' do
      it 'should not move north on the top edge' do
        @robot.place_at x: x_valid, y: (BOARD_HEIGHT - 1), orientation: :north
        @robot.move
        @robot.x.must_equal x_valid
        @robot.y.must_equal(BOARD_HEIGHT - 1)
      end

      it 'should not move south on the bottom edge' do
        @robot.place_at x: x_valid, y: 0, orientation: :south
        @robot.move
        @robot.x.must_equal x_valid
        @robot.y.must_equal 0
      end

      it 'should not move west on the left edge' do
        @robot.place_at x: 0, y: y_valid, orientation: :west
        @robot.move
        @robot.x.must_equal 0
        @robot.y.must_equal y_valid
      end

      it 'should not move south on the bottom edge' do
        @robot.place_at x: (BOARD_WIDTH - 1), y: y_valid, orientation: :east
        @robot.move
        @robot.x.must_equal(BOARD_WIDTH - 1)
        @robot.y.must_equal y_valid
      end
    end
  end
end
