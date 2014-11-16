#!/usr/bin/env ruby
require_relative '../lib/parser'

parser = Parser.new
ARGF.each do |line|
  command = line.rstrip
  parser.parse command
end
