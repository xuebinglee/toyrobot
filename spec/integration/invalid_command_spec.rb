describe 'Invalid command' do
  let(:parser) { Parser.new(robot: robot) }
  let(:robot) { Robot.new(board: board) }
  let(:board) { Board.new }

  before do
    allow(STDOUT).to receive(:puts)
    commands.each { |command| parser.parse(command) }
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
