require_relative 'spec_helper'
require 'board'

describe Board do
  describe 'setup' do
    let(:board) { Board.new width: BOARD_WIDTH, height: BOARD_HEIGHT }

    it 'should know its width' do
      board.width.must_equal BOARD_WIDTH
    end

    it 'should know its height' do
      board.height.must_equal BOARD_HEIGHT
    end

    let(:default_board) { Board.new }

    it 'should have a default width of 5' do
      default_board.width.must_equal 5
    end

    it 'should have a default height of 5' do
      default_board.height.must_equal 5
    end
  end
end
