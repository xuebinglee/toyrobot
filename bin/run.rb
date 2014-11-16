#!/usr/bin/env ruby
require_relative '../lib/parser'

parser = Parser.new
ARGF.each do |command|
  parser.parse command
  parser.parse 'REPORT'
end
