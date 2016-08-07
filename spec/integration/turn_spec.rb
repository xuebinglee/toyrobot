describe 'Turn' do
  let(:dispatcher) { Dispatcher.new(robot: robot) }
  let(:robot) { Robot.new }

  before do
    allow(STDOUT).to receive(:puts)
    commands.each { |command| dispatcher.parse(command) }
  end

  describe '360 degrees' do
    context 'anticlockwise' do
      let(:commands) do
        ['PLACE 2,4,NORTH',
         'LEFT',
         'LEFT',
         'LEFT',
         'LEFT',
         'REPORT']
      end

      it 'faces initial direction' do
        expect(STDOUT).to have_received(:puts).with('2,4,NORTH')
      end
    end

    context 'clockwise' do
      let(:commands) do
        ['PLACE 2,4,NORTH',
         'RIGHT',
         'RIGHT',
         'RIGHT',
         'RIGHT',
         'REPORT']
      end

      it 'faces initial direction' do
        expect(STDOUT).to have_received(:puts).with('2,4,NORTH')
      end
    end
  end
end
