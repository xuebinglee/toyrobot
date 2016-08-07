describe 'Turn' do
  include Reducer

  before do
    allow(STDOUT).to receive(:puts)
    commands.reduce(Reducer::INITIAL_STATE) do |state, command|
      action = Parser.parse(command)
      robot(state, action)
    end
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
