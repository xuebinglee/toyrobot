describe Parser do
  describe '#parse' do
    subject(:parser) { Parser.new(robot: robot) }
    let(:robot) { Robot.new(board: board) }
    let(:board) { Board.new }

    describe 'PLACE command' do
      it 'should place robot when command is valid' do
        parser.parse 'PLACE 0,1,NORTH'
        expect(robot.x).to eq(0)
        expect(robot.y).to eq(1)
        expect(robot.orientation).to eq(:north)
      end

      it 'should ignore invalid command' do
        parser.parse 'PLACE 0,6,SOUTH'
        expect(robot).to_not be_on_board
      end
    end

    describe 'LEFT command' do
      it 'should turn robot left when robot is on board' do
        parser.parse 'PLACE 1,2,SOUTH'
        parser.parse 'LEFT'
        expect(robot.orientation).to eq(:east)
      end

      it 'should ignore command when robot is off board' do
        parser.parse 'PLACE 6,0,WEST'
        parser.parse 'LEFT'
        expect(robot).to_not be_on_board
      end
    end

    describe 'RIGHT command' do
      it 'should turn robot right when robot is on board' do
        parser.parse 'PLACE 1,2,SOUTH'
        parser.parse 'RIGHT'
        expect(robot.orientation).to eq(:west)
      end

      it 'should ignore command when robot is off board' do
        parser.parse 'PLACE 6,0,WEST'
        parser.parse 'RIGHT'
        expect(robot).to_not be_on_board
      end
    end

    describe 'REPORT command' do
      before { allow(STDOUT).to receive(:puts) }

      it 'should report X, Y, and orientation when on board' do
        parser.parse 'PLACE 4,0,EAST'
        parser.parse 'REPORT'
        expect(STDOUT).to have_received(:puts).with('4,0,EAST')
      end

      it 'should ignore command when off board' do
        parser.parse 'PLACE 5,0,WEST'
        parser.parse 'REPORT'
        expect(STDOUT).to_not have_received(:puts)
      end
    end

    describe 'MOVE command' do
      it 'should move robot as directed given a valid command' do
        parser.parse 'PLACE 3,0,EAST'
        parser.parse 'MOVE'
        expect(robot.x).to eq(4)
        expect(robot.y).to eq(0)
      end

      it 'should ignore command when off board' do
        parser.parse 'PLACE 4,0,EAST'
        parser.parse 'MOVE'
        expect(robot.x).to eq(4)
        expect(robot.y).to eq(0)
      end
    end
  end
end
