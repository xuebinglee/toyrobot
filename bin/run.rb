#!/usr/bin/env ruby
require_relative '../lib/dispatcher'
require_relative '../lib/robot'

def run
  robot = Robot.new
  dispatcher = Dispatcher.new(robot: robot)
  ARGF.each do |line|
    dispatcher.parse(line)
  end
end

run if __FILE__ == $PROGRAM_NAME
