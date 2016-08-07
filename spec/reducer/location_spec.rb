describe 'location' do
  include Reducer

  subject { location(state, action) }

  describe 'MOVE' do
    context 'when far from edge' do
      let(:state) do
        {
          location: { x: 1, y: 1 },
          orientation: :north
        }
      end
      let(:action) do
        { type: :move }
      end
      let(:expected) do
        {
          location: { x: 1, y: 2 },
          orientation: :north
        }
      end

      it { is_expected.to eq(expected) }
    end

    context 'when moving north from top edge' do
      let(:state) do
        {
          location: { x: 1, y: 4 },
          orientation: :north
        }
      end
      let(:action) do
        { type: :move }
      end
      let(:expected) do
        {
          location: { x: 1, y: 4 },
          orientation: :north
        }
      end

      it { is_expected.to eq(expected) }
    end

    context 'when moving east from right edge' do
      let(:state) do
        {
          location: { x: 4, y: 1 },
          orientation: :east
        }
      end
      let(:action) do
        { type: :move }
      end
      let(:expected) do
        {
          location: { x: 4, y: 1 },
          orientation: :east
        }
      end

      it { is_expected.to eq(expected) }
    end

    context 'when moving south from bottom edge' do
      let(:state) do
        {
          location: { x: 1, y: 0 },
          orientation: :south
        }
      end
      let(:action) do
        { type: :move }
      end
      let(:expected) do
        {
          location: { x: 1, y: 0 },
          orientation: :south
        }
      end

      it { is_expected.to eq(expected) }
    end

    context 'when moving west from left edge' do
      let(:state) do
        {
          location: { x: 0, y: 4 },
          orientation: :west
        }
      end
      let(:action) do
        { type: :move }
      end
      let(:expected) do
        {
          location: { x: 0, y: 4 },
          orientation: :west
        }
      end

      it { is_expected.to eq(expected) }
    end
  end
end
