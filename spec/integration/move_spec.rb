describe 'Move' do
  let(:dispatcher) { Dispatcher.new(robot: robot) }
  let(:robot) { Robot.new(board: board) }
  let(:board) { Board.new }

  before do
    allow(STDOUT).to receive(:puts)
    commands.each { |command| dispatcher.parse(command) }
  end

  describe 'avoid falling from edge' do
    context 'when directed to move north from top edge' do
      let(:commands) do
        ['PLACE 2,4,NORTH',
         'MOVE',
         'REPORT']
      end

      it 'does not move' do
        expect(STDOUT).to have_received(:puts).with('2,4,NORTH')
      end
    end

    context 'when directed to move south from bottom edge' do
      let(:commands) do
        ['PLACE 2,0,SOUTH',
         'MOVE',
         'REPORT']
      end

      it 'does not move' do
        expect(STDOUT).to have_received(:puts).with('2,0,SOUTH')
      end
    end

    context 'when directed to move west from left edge' do
      let(:commands) do
        ['PLACE 0,2,WEST',
         'MOVE',
         'REPORT']
      end

      it 'does not move' do
        expect(STDOUT).to have_received(:puts).with('0,2,WEST')
      end
    end

    context 'when directed to move east from right edge' do
      let(:commands) do
        ['PLACE 4,2,EAST',
         'MOVE',
         'REPORT']
      end

      it 'does not move' do
        expect(STDOUT).to have_received(:puts).with('4,2,EAST')
      end
    end
  end

  describe 'walk on all edges' do
    context 'anticlockwise' do
      let(:commands) do
        ['PLACE 0,0,NORTH',
         'RIGHT',
         'MOVE',
         'MOVE',
         'MOVE',
         'MOVE',
         'LEFT',
         'MOVE',
         'MOVE',
         'MOVE',
         'MOVE',
         'LEFT',
         'MOVE',
         'MOVE',
         'MOVE',
         'MOVE',
         'LEFT',
         'MOVE',
         'MOVE',
         'MOVE',
         'MOVE',
         'REPORT']
      end

      it 'correctly reports' do
        expect(STDOUT).to have_received(:puts).with('0,0,SOUTH')
      end
    end

    context 'clockwise' do
      let(:commands) do
        ['PLACE 0,0,NORTH',
         'MOVE',
         'MOVE',
         'MOVE',
         'MOVE',
         'RIGHT',
         'MOVE',
         'MOVE',
         'MOVE',
         'MOVE',
         'RIGHT',
         'MOVE',
         'MOVE',
         'MOVE',
         'MOVE',
         'RIGHT',
         'MOVE',
         'MOVE',
         'MOVE',
         'MOVE',
         'REPORT']
      end

      it 'correctly repots' do
        expect(STDOUT).to have_received(:puts).with('0,0,WEST')
      end
    end
  end
end
