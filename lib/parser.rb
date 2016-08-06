class Parser
  attr_reader :robot

  def initialize(robot:)
    @robot = robot
  end

  def parse(line)
    line = line.rstrip
    case line.split[0]
    when 'PLACE'
      x, y, orientation = line[6..-1].split(',')
      @robot.place_at(x: x.to_i,
                      y: y.to_i,
                      orientation: orientation.downcase.to_sym)
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
end
