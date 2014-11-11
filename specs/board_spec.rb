require 'minitest/autorun'
require_relative 'spec_helper'
require 'board'

describe Board do
  describe 'setup' do
    before do
      @board = Board.new(BOARD_WIDTH, BOARD_HEIGHT)
    end

    it 'knows its width' do
      @board.width.must_equal BOARD_WIDTH
    end

    it 'knows its height' do
      @board.height.must_equal BOARD_HEIGHT
    end
  end
end
