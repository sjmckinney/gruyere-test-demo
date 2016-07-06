module Utilities

  def self.validate_and_set_log_level()

    $LOG.info("ENV['log_level'] is #{ENV['log_level']}")

    if(ENV['log_level'].nil?)
      ENV['log_level']='info'
      $LOG.warn("***** Defaulting ENV['log_level'] to info *****")
    end

    raise "Environment variable ENV['log_level'] => #{ENV['log_level']} is not valid" unless
      ['info', 'warn', 'debug', 'error', 'fatal' ].include?(ENV['log_level'])

    case ENV['log_level']
      when 'debug'
        $LOG.level = 0
      when 'info'
        $LOG.level = 1
      when 'warn'
        $LOG.level = 2
      when 'error'
        $LOG.level = 3
      when 'FATAL'
        $LOG.level = 4
    end

    $LOG.info("$LOG.level set to #{$LOG.level}")

  end

  def self.validate_browser

    $LOG.info("ENV['browser'] is #{ENV['browser']}")

    if(ENV['browser'].nil?)
      ENV['browser']='firefox'
      $LOG.warn("***** Defaulting ENV['browser'] to firefox *****")
    end

    raise "Environment variable ENV['browser'] => #{ENV['browser']} is not valid" unless
        ['firefox', 'chrome', 'internet_explorer', 'safari', 'ms_edge' ].include?(ENV['browser'])


  end

end