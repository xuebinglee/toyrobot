require 'minitest/autorun'
require 'board'
require 'robot'

describe Robot do
  describe 'setup' do
    before do
      @board = Board.new(5, 5)
      @robot = Robot.new(@board)
    end

    it 'knows the board that it\'s on' do
      @robot.board.must_equal @board
    end
  end
end
