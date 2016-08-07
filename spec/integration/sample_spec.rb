describe 'Samples' do
  include Reducer

  before do
    allow(STDOUT).to receive(:puts)
    commands.reduce(Reducer::INITIAL_STATE) do |state, command|
      action = Parser.parse(command)
      robot(state, action)
    end
  end

  describe 'first sample' do
    let(:commands) do
      ['PLACE 0,0,NORTH',
       'MOVE',
       'REPORT']
    end

    it 'correctly reports' do
      expect(STDOUT).to have_received(:puts).with('0,1,NORTH')
    end
  end

  describe 'second sample' do
    let(:commands) do
      ['PLACE 0,0,NORTH',
       'LEFT',
       'REPORT']
    end

    it 'correctly reports' do
      expect(STDOUT).to have_received(:puts).with('0,0,WEST')
    end
  end

  describe 'third sample' do
    let(:commands) do
      ['PLACE 1,2,EAST',
       'MOVE',
       'MOVE',
       'LEFT',
       'MOVE',
       'REPORT']
    end

    it 'correctly reports' do
      expect(STDOUT).to have_received(:puts).with('3,3,NORTH')
    end
  end
end
