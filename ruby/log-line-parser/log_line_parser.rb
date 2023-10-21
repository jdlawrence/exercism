class LogLineParser
  def initialize(line)
    @line = line
  end

  def message
    return @line.split(' ')[1..-1].join(' ')
  end

  def log_level
    return @line.split(' ')[0].downcase.gsub(/[^a-z0-9\s]/i, '')
  end

  def reformat
    return "#{self.message} (#{self.log_level})"
  end
end
