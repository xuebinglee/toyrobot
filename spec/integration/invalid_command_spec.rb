describe 'Invalid command' do
  include Reducer

  before do
    allow(STDOUT).to receive(:puts)
    commands.reduce(Reducer::INITIAL_STATE) do |state, command|
      action = Parser.parse(command)
      robot(state, action)
    end
  end

  describe 'invalid command in the beginning' do
    let(:commands) do
      ['INVALID',
       'PLACE 2,4,NORTH',
       'LEFT',
       'MOVE',
       'REPORT']
    end

    it 'ignores invalid command' do
      expect(STDOUT).to have_received(:puts).with('1,4,WEST')
    end
  end

  describe 'invalid command in the middle' do
    let(:commands) do
      ['PLACE 2,4,NORTH',
       'INVALID',
       'LEFT',
       'MOVE',
       'REPORT']
    end

    it 'ignores invalid command' do
      expect(STDOUT).to have_received(:puts).with('1,4,WEST')
    end
  end

  describe 'invliad command in the end' do
    let(:commands) do
      ['PLACE 2,4,NORTH',
       'LEFT',
       'MOVE',
       'INVALID',
       'REPORT']
    end

    it 'ignores invalid command' do
      expect(STDOUT).to have_received(:puts).with('1,4,WEST')
    end
  end
end
