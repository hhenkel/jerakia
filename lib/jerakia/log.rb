class Jerakia::Log < Jerakia
  require 'logger'
  def initialize(level = :info, file = '/var/log/jerakia.log')
    begin
      @@logger = Logger.new(file)
    rescue Errno::EACCES => e
      raise Jerakia::Error, "Error opening log file, #{e.message}"
    end

    @@level = level
    case @@level
    when :verbose
      @@logger.level = Logger::INFO
    when :info
      @@logger.level = Logger::INFO
    when :debug
      @@logger.level = Logger::DEBUG
    end
  end

  def logger
    @@logger
  end

  def verbose(msg)
    @@logger.info msg if @@level == :verbose
  end

  def info(msg)
    @@logger.info msg
  end

  def debug(msg)
    @@logger.debug msg
  end

  def error(msg)
    @@logger.error msg
  end

  def fatal(msg)
    @@logger.fatal msg
  end

end
