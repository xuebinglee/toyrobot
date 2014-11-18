#!/usr/bin/env ruby
require_relative '../lib/parser'
require_relative '../lib/robot'

def run
  robot = Robot.build
  parser = Parser.new robot: robot
  ARGF.each do |line|
    command = line.rstrip
    parser.parse command
  end
end

if __FILE__ == $0
  run
end
