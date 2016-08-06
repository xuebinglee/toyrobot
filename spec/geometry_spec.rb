describe 'Geometry' do
  subject(:geometry) do
    Geometry.new(board: board,
                 x: x,
                 y: y,
                 orientation: orientation)
  end
  let(:board) { @board = Board.new }
  let(:x) { 1 }
  let(:y) { 2 }
  let(:orientation) { :north }

  describe '#initialize' do
    it 'assigns the correct value to x' do
      expect(geometry.x).to eq(x)
    end

    it 'assigns the correct value to y' do
      expect(geometry.y).to eq(y)
    end

    it 'assigns the correct orientation' do
      expect(geometry.orientation).to eq(orientation)
    end
  end
end
