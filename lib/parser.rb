class Parser
  attr_reader :robot

  def initialize(opts)
    @robot = opts[:robot]
  end

  def parse(line)
    case line.rstrip.split[0]
    when 'PLACE'
      parse_place(line)
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
  def parse_place(line)
    x, y, orientation = line[6..-1].split(',')
    x = x.to_i
    y = y.to_i
    orientation = orientation.downcase.to_sym
    @robot.place_at x: x, y: y, orientation: orientation
  end
end
