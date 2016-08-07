module Parser
  def self.parse(line)
    line = line.rstrip
    case line.split[0]
    when 'PLACE'
      x, y, orientation = line[6..-1].split(',')
      {
        type: :place,
        location: { x: x.to_i, y: y.to_i },
        orientation: orientation.downcase.to_sym
      }
    when 'LEFT'
      { type: :left }
    when 'RIGHT'
      { type: :right }
    when 'MOVE'
      { type: :move }
    when 'REPORT'
      { type: :report }
    end
  end
end
