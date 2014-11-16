require 'robot'

class Parser
  attr_reader :in_stream, :robot

  def initialize(opts={})
    @in_stream = opts[:from] || $stdin
    @board = Board.new
    @robot = Robot.new(@board)
  end

  def parse(command)
    case command[0..4]
    when 'PLACE'
      place(command)
    end
  end

  private
  def place(command)
    x, y, orientation = command[6..-1].split(',')
    x = x.to_i
    y = y.to_i
    orientation = orientation.downcase.to_sym
    @robot.place_at x: x, y: y, orientation: orientation
  end
end
