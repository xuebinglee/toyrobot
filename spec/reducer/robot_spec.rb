describe 'robot' do
  include Reducer

  subject { robot(state, action) }

  describe 'LEFT' do
    let(:state) do
      {
        location: { x: 0, y: 0 },
        orientation: :north
      }
    end
    let(:action) do
      { type: :left }
    end
    let(:expected) do
      {
        location: { x: 0, y: 0 },
        orientation: :west
      }
    end

    it { is_expected.to eq(expected) }
  end

  describe 'RIGHT' do
    let(:state) do
      {
        location: { x: 0, y: 0 },
        orientation: :north
      }
    end
    let(:action) do
      { type: :right }
    end
    let(:expected) do
      {
        location: { x: 0, y: 0 },
        orientation: :east
      }
    end

    it { is_expected.to eq(expected) }
  end

  describe 'MOVE' do
    let(:state) do
      {
        location: { x: 0, y: 0 },
        orientation: :north
      }
    end
    let(:action) do
      { type: :move }
    end
    let(:expected) do
      {
        location: { x: 0, y: 1 },
        orientation: :north
      }
    end

    it { is_expected.to eq(expected) }
  end

  describe 'PLACE' do
    context 'when placed on board' do
      let(:state) do
        {
          location: { x: 0, y: 0 },
          orientation: :north
        }
      end
      let(:action) do
        { type: :place, location: { x: 1, y: 1 }, orientation: :south }
      end
      let(:expected) do
        {
          location: { x: 1, y: 1 },
          orientation: :south
        }
      end

      it { is_expected.to eq(expected) }
    end
  end
end
