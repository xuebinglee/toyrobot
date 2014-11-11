require 'minitest/spec'
require 'minitest/autorun'
require 'board'

describe Board do
  describe '#initialize' do
    before do
      @board = Board.new(5, 5)
    end

    it 'knows its width' do
      @board.width.must_equal 5
    end

    it 'knows its height' do
      @board.height.must_equal 5
    end
  end
end
