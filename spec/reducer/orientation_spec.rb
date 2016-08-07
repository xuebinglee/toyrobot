describe 'orientation' do
  include Reducer

  subject { orientation(state, action) }

  describe 'LEFT' do
    let(:action) do
      { type: :left }
    end

    context 'given nil' do
      let(:state) { nil }

      it { is_expected.to eq(nil) }
    end

    context 'given north' do
      let(:state) { :north }

      it { is_expected.to eq(:west) }
    end

    context 'given east' do
      let(:state) { :east }

      it { is_expected.to eq(:north) }
    end

    context 'given south' do
      let(:state) { :south }

      it { is_expected.to eq(:east) }
    end

    context 'given west' do
      let(:state) { :west }

      it { is_expected.to eq(:south) }
    end
  end

  describe 'RIGHT' do
    let(:action) do
      { type: :right }
    end

    context 'given nil' do
      let(:state) { nil }

      it { is_expected.to eq(nil) }
    end

    context 'given north' do
      let(:state) { :north }

      it { is_expected.to eq(:east) }
    end

    context 'given east' do
      let(:state) { :east }

      it { is_expected.to eq(:south) }
    end

    context 'given south' do
      let(:state) { :south }

      it { is_expected.to eq(:west) }
    end

    context 'given west' do
      let(:state) { :west }

      it { is_expected.to eq(:north) }
    end
  end
end
