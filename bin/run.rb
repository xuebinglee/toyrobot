#!/usr/bin/env ruby
require_relative '../lib/dispatcher'
require_relative '../lib/robot'
require_relative '../lib/board'

def run
  board = Board.new
  robot = Robot.new(board: board)
  dispatcher = Dispatcher.new(robot: robot)
  ARGF.each do |line|
    dispatcher.parse(line)
  end
end

run if __FILE__ == $PROGRAM_NAME
