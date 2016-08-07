#!/usr/bin/env ruby
require_relative '../lib/parser'
require_relative '../lib/robot'
require_relative '../lib/board'

def run
  board = Board.new
  robot = Robot.new(board: board)
  parser = Parser.new(robot: robot)
  ARGF.each do |line|
    parser.parse line
  end
end

run if __FILE__ == $PROGRAM_NAME
