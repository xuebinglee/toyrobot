describe 'Geometry' do
  let(:x) { 1 }
  let(:y) { 2 }
  let(:orientation) { :north }

  describe '#initialize' do
    context 'given no geometry' do
      let(:geometry) { Geometry.new(nil, x: x, y: y, orientation: orientation) }

      it 'correctly assigns x' do
        expect(geometry.x).to eq(x)
      end

      it 'correctly assigns y' do
        expect(geometry.y).to eq(y)
      end

      it 'correctly assigns orientation' do
        expect(geometry.orientation).to eq(orientation)
      end
    end

    context 'given an geometry' do
      let(:existing) { Geometry.new(nil, x: x, y: x, orientation: orientation) }

      context 'without overrides' do
        let(:geometry) { Geometry.new(existing) }

        it 'is the same as that geometry' do
          expect(geometry.x).to eq(existing.x)
          expect(geometry.y).to eq(existing.y)
          expect(geometry.orientation).to eq(existing.orientation)
        end
      end

      context 'with overrides' do
        let(:geometry) { Geometry.new(existing, x: x_override) }
        let(:x_override) { -1 }

        it 'merges overrides with that geometry' do
          expect(geometry.x).to eq(x_override)
          expect(geometry.y).to eq(existing.y)
          expect(geometry.orientation).to eq(existing.orientation)
        end
      end
    end
  end

  describe '#valid?' do
    subject(:valid?) { geometry.valid? }
    let(:geometry) { Geometry.new(nil, x: x, y: y, orientation: orientation) }

    context 'when x is negative' do
      let(:x) { -1 }

      it { is_expected.to be(false) }
    end

    context 'when x is larger than board width' do
      let(:x) { Board::WIDTH + 1 }

      it { is_expected.to be(false) }
    end

    context 'when y is negative' do
      let(:y) { -1 }

      it { is_expected.to be(false) }
    end

    context 'when y is larger than board height' do
      let(:y) { Board::HEIGHT + 1 }

      it { is_expected.to be(false) }
    end
  end
end
