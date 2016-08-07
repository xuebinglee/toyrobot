#!/usr/bin/env ruby
require_relative '../lib/parser'
require_relative '../lib/reducer/robot'

class ToyRobot
  include Reducer

  def run
    ARGF.reduce(Reducer::INITIAL_STATE) do |state, line|
      action = Parser.parse(line)
      robot(state, action)
    end
  end
end

ToyRobot.new.run if __FILE__ == $PROGRAM_NAME
