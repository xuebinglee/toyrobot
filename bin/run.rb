#!/usr/bin/env ruby
require_relative '../lib/parser'

def run
  parser = Parser.new
  ARGF.each do |line|
    command = line.rstrip
    parser.parse command
  end
end

if __FILE__ == $0
  run
end
