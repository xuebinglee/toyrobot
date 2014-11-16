require 'minitest/autorun'
require_relative 'spec_helper'
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
      it 'places robot when command is valid' do
        parser.parse 'PLACE 0,1,NORTH'
        parser.robot.geometry.on_board.must_equal true
        parser.robot.geometry.x.must_equal 0
        parser.robot.geometry.y.must_equal 1
        parser.robot.geometry.orientation.must_equal :north
      end

      it 'ignores invalid command' do
        parser.parse 'PLACE 0,6,SOUTH'
        parser.robot.geometry.on_board.must_equal false
      end
    end
  end
end
