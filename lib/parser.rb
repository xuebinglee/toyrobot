require_relative 'robot'

class Parser
  attr_reader :robot

  def initialize(opts={})
    @board = Board.new
    @robot = Robot.new(@board)
  end

  def parse(command)
    case command.split[0]
    when 'PLACE'
      place(command)
    when 'LEFT'
      @robot.turn_left
    when 'RIGHT'
      @robot.turn_right
    when 'MOVE'
      @robot.move
    when 'REPORT'
      @robot.report
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
