require_relative 'spec_helper'
require 'minitest/autorun'
require 'parser'

describe Parser do
  it 'should use stdin as default input stream' do
    parser = Parser.new
    parser.in_stream.must_be_same_as $stdin
  end

  it 'should accept a custom input stream' do
    $custom = 'something not nil'
    parser = Parser.new from: $custom
    parser.in_stream.must_be_same_as $custom
  end

  describe '#parse' do
    let(:parser) { Parser.new }

    describe 'PLACE command' do
      it 'should place robot when command is valid' do
        parser.parse 'PLACE 0,1,NORTH'
        parser.robot.geometry.x.must_equal 0
        parser.robot.geometry.y.must_equal 1
        parser.robot.geometry.orientation.must_equal :north
      end

      it 'should ignore invalid command' do
        parser.parse 'PLACE 0,6,SOUTH'
        parser.robot.geometry.must_be_nil
      end
    end

    describe 'LEFT command' do
      it 'should turn robot left when robot is on board' do
        parser.parse 'PLACE 1,2,SOUTH'
        parser.parse 'LEFT'
        parser.robot.geometry.orientation.must_equal :east
      end

      it 'should ignore command when robot is off board' do
        parser.parse 'PLACE 6,0,WEST'
        parser.parse 'LEFT'
        parser.robot.geometry.must_be_nil
      end
    end

    describe 'RIGHT command' do
      it 'should turn robot right when robot is on board' do
        parser.parse 'PLACE 1,2,SOUTH'
        parser.parse 'RIGHT'
        parser.robot.geometry.orientation.must_equal :west
      end

      it 'should ignore command when robot is off board' do
        parser.parse 'PLACE 6,0,WEST'
        parser.parse 'RIGHT'
        parser.robot.geometry.must_be_nil
      end
    end

    describe 'REPORT command' do
      it 'should report X, Y, and orientation when on board' do
        parser.parse 'PLACE 4,0,EAST'
        lambda { parser.parse 'REPORT' }.must_output "4,0,EAST\n"
      end

      it 'should ignore command when off board' do
        parser.parse 'PLACE 5,0,WEST'
        lambda { parser.parse 'REPORT' }.must_be_silent
      end
    end

    describe 'MOVE command' do
      it 'should move robot as directed given a valid command' do
        parser.parse 'PLACE 3,0,EAST'
        parser.parse 'MOVE'
        parser.robot.geometry.x.must_equal 4
        parser.robot.geometry.y.must_equal 0
      end

      it 'should ignore command when off board' do
        parser.parse 'PLACE 4,0,EAST'
        parser.parse 'MOVE'
        parser.robot.geometry.x.must_equal 4
        parser.robot.geometry.y.must_equal 0
      end
    end
  end
end
