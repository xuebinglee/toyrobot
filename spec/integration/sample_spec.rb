describe 'Samples' do
  let(:dispatcher) { Dispatcher.new(robot: robot) }
  let(:robot) { Robot.new(board: board) }
  let(:board) { Board.new }

  before do
    allow(STDOUT).to receive(:puts)
    commands.each { |command| dispatcher.parse(command) }
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
