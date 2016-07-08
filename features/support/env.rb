require 'selenium-webdriver'
require 'dotenv'
require 'logger'
require_relative 'utilities'

include Utilities

World(Utilities)

Dotenv.load '.env'

$LOG = Logger.new('gruyere-test-demo.log')

Before do |scenario|

  $LOG.info('---------------------------------------------------------')
  $LOG.info("Beginning scenario \"#{scenario.name}\".")

  begin

    Utilities.validate_browser
    Utilities.validate_and_set_log_level

    @driver = Selenium::WebDriver.for (ENV['browser']).to_sym
    $LOG.info("Driver of type #{ENV['browser']} created.")

  rescue Exception => e

    $LOG.info("Error has occurred in : #{__FILE__} @ line #{__LINE__}")
    $LOG.error("Error.message: #{e.message}")
    $LOG.debug("Error.backtrace: #{e.backtrace}")
    raise

  end

end

After do |scenario|

  @driver.quit
  $LOG.info('---------------------------------------------------------')

end