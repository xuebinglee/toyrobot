describe Board do
  describe '#initialize' do
    context 'given width and height' do
      let(:board) { Board.new(width, height) }
      let(:width)  { 10 }
      let(:height) { 10 }

      it 'sets width' do
        expect(board.width).to eq(width)
      end

      it 'sets height' do
        expect(board.height).to eq(height)
      end
    end

    context 'given no width and height' do
      let(:board) { Board.new }

      it 'defaults width to 5' do
        expect(board.width).to eq(5)
      end

      it 'defaults height to 5' do
        expect(board.height).to eq(5)
      end
    end
  end
end
