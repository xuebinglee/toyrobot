# Optionally require simplecov to generate test coverage report
begin
  # The next line will throw an exception if simplecov is not installed
  Gem::Specification.find_by_name 'simplecov'
  require 'simplecov'
  SimpleCov.start
rescue Gem::LoadError
  # Nothing needs to be done here as simplecov is optional
end

require 'minitest/autorun'
require 'robot'

# Assume the board has a width of 5 and a height of 5
BOARD_WIDTH  = 5
BOARD_HEIGHT = 5
ORIENTATIONS = [:north, :east, :south, :west].freeze
