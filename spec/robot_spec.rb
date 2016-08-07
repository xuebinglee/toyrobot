describe Robot do
  subject(:robot) { Robot.new }
  let(:x) { 1 }
  let(:y) { 2 }
  let(:orientation) { :south }

  describe '#place_at' do
    describe 'initial placement' do
      context 'when placed on board' do
        it 'is on board' do
          robot.place_at(x: x, y: y, orientation: orientation)
          expect(robot).to be_on_board
        end

        it 'has the correct value of X' do
          robot.place_at(x: x, y: y, orientation: orientation)
          expect(robot.x).to eq(x)
        end

        it 'has the correct value of Y' do
          robot.place_at(x: x, y: y, orientation: orientation)
          expect(robot.y).to eq(y)
        end

        it 'has the correct orientation' do
          robot.place_at(x: x, y: y, orientation: orientation)
          expect(robot.orientation).to eq(orientation)
        end
      end

      context 'when placed off board' do
        context 'when x is larger than board width' do
          let(:x) { Board::WIDTH + 1 }

          it 'is not on board' do
            robot.place_at(x: x, y: y, orientation: orientation)
            expect(robot).to_not be_on_board
          end
        end

        context 'when y is larger than board height' do
          let(:y) { Board::HEIGHT + 1 }

          it 'is not on board' do
            robot.place_at(x: x, y: y, orientation: orientation)
            expect(robot).to_not be_on_board
          end
        end
      end
    end
  end

  describe '#report' do
    before { allow(STDOUT).to receive(:puts) }

    context 'when robot is not placed' do
      it 'does not print' do
        robot.report
        expect(STDOUT).to_not have_received(:puts)
      end
    end

    context 'when robot is placed off board' do
      let(:x) { Board::WIDTH + 1 }

      it 'does not print' do
        robot.place_at(x: x, y: y, orientation: orientation)
        robot.report
        expect(STDOUT).to_not have_received(:puts)
      end
    end

    context 'when placed on board' do
      it 'prints current location and orientation' do
        robot.place_at(x: x, y: y, orientation: orientation)
        robot.report
        expect(STDOUT).to have_received(:puts)
          .with("#{x},#{y},#{orientation.upcase}")
      end
    end
  end

  describe '#turn_left' do
    context 'when initially facing north' do
      it 'turns to west' do
        robot.place_at(x: x, y: y, orientation: :north)
        robot.turn_left
        expect(robot.orientation).to eq(:west)
      end
    end

    context 'when initially facing west' do
      it 'turns to south' do
        robot.place_at(x: x, y: y, orientation: :west)
        robot.turn_left
        expect(robot.orientation).to eq(:south)
      end
    end

    context 'when initially facing south' do
      it 'turns to east ' do
        robot.place_at(x: x, y: y, orientation: :south)
        robot.turn_left
        expect(robot.orientation).to eq(:east)
      end
    end

    context 'when initially facing east' do
      it 'should turn to north ' do
        robot.place_at(x: x, y: y, orientation: :east)
        robot.turn_left
        expect(robot.orientation).to eq(:north)
      end
    end
  end

  describe '#turn_right' do
    context 'when initially facing south' do
      it 'turns to west' do
        robot.place_at(x: x, y: y, orientation: :south)
        robot.turn_right
        expect(robot.orientation).to eq(:west)
      end
    end

    context 'when initially facing east' do
      it 'turns to south' do
        robot.place_at(x: x, y: y, orientation: :east)
        robot.turn_right
        expect(robot.orientation).to eq(:south)
      end
    end

    context 'when initially facing north' do
      it 'turns to east' do
        robot.place_at(x: x, y: y, orientation: :north)
        robot.turn_right
        expect(robot.orientation).to eq(:east)
      end
    end

    context 'when initially facing west' do
      it 'turns to north' do
        robot.place_at(x: x, y: y, orientation: :west)
        robot.turn_right
        expect(robot.orientation).to eq(:north)
      end
    end
  end

  describe '#move' do
    context 'when asked to move on board' do
      context 'when facing north' do
        it 'moves in the right direction' do
          robot.place_at(x: x, y: y, orientation: :north)
          robot.move
          expect(robot.x).to eq(x)
          expect(robot.y).to eq(y + 1)
        end
      end

      context 'when facing east' do
        it 'moves in the right direction' do
          robot.place_at(x: x, y: y, orientation: :east)
          robot.move
          expect(robot.x).to eq(x + 1)
          expect(robot.y).to eq(y)
        end
      end

      context 'when facing south' do
        it 'moves in the right direction' do
          robot.place_at(x: x, y: y, orientation: :south)
          robot.move
          expect(robot.x).to eq(x)
          expect(robot.y).to eq(y - 1)
        end
      end

      context 'when facing west' do
        it 'moves in the right direction' do
          robot.place_at(x: x, y: y, orientation: :west)
          robot.move
          expect(robot.x).to eq(x - 1)
          expect(robot.y).to eq(y)
        end
      end
    end

    context 'when asked to move off board' do
      context 'when on the top edge' do
        it 'does not move north' do
          robot.place_at(x: x, y: Board::HEIGHT - 1, orientation: :north)
          robot.move
          expect(robot.x).to eq(x)
          expect(robot.y).to eq(Board::HEIGHT - 1)
        end
      end

      context 'when on the bottom edge' do
        it 'does not move south' do
          robot.place_at(x: x, y: 0, orientation: :south)
          robot.move
          expect(robot.x).to eq(x)
          expect(robot.y).to eq(0)
        end
      end

      context 'when on the left edge' do
        it 'does not move west' do
          robot.place_at(x: 0, y: y, orientation: :west)
          robot.move
          expect(robot.x).to eq(0)
          expect(robot.y).to eq(y)
        end
      end

      context 'when on the right edge' do
        it 'does not move east' do
          robot.place_at(x: Board::WIDTH - 1, y: y, orientation: :east)
          robot.move
          expect(robot.x).to eq(Board::WIDTH - 1)
          expect(robot.y).to eq(y)
        end
      end
    end
  end
end
