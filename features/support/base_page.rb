require_relative 'utilities'

class BasePage

  include Utilities

  def initialize(driver)

    @driver = driver

  end

  def visit(url)

    @driver.get(url)

  end

  def find(locator)

    begin

      @driver.find_element(locator)

    rescue Exception => e

      $LOG.info("Error has occurred in : #{__FILE__} @ line #{__LINE__}")
      $LOG.error("Error.message: #{e.message}")
      $LOG.debug("Error.backtrace: #{e.backtrace}")
      Utilities.take_screenshot(__FILE__, __LINE__)
      raise

    end

  end

  def find_all(locator)

    @driver.find_elements(locator)

  end

  def enter_text(locator, text)

    find(locator).send_keys(text)

  end

  def click_element(locator)

    begin

      @driver.find_element(locator).click

    rescue Exception => e

      $LOG.info("Error has occurred in : #{__FILE__} @ line #{__LINE__}")
      $LOG.error("Error.message: #{e.message}")
      $LOG.debug("Error.backtrace: #{e.backtrace}")
      take_screenshot(__FILE__, __LINE__)
      raise

    end

  end

  def click_button(locator)

    click_element(locator)

    $LOG.info("Clicked on #{locator.values[0]} button")

  end

  def click_link(locator)

    click_element(locator)

    $LOG.info("Clicked on #{locator.values[0]} link")

  end

  def get_text(locator)

    begin

      @driver.find_element(locator).text

    rescue Exception => e

      $LOG.info("Error has occurred in : #{__FILE__} @ line #{__LINE__}")
      $LOG.error("Error.message: #{e.message}")
      $LOG.debug("Error.backtrace: #{e.backtrace}")
      take_screenshot(__FILE__, __LINE__)
      raise

    end


  end

  def wait_for(seconds = 15)

    begin

      Selenium::WebDriver::Wait.new(:timeout => seconds).until { yield }

    rescue Exception => e

      $LOG.info("Error has occurred in : #{__FILE__} @ line #{__LINE__}")
      $LOG.error("Error.message: #{e.message}")
      $LOG.debug("Error.backtrace: #{e.backtrace}")
      take_screenshot(__FILE__, __LINE__)
      raise

    end

  end

  def is_displayed?(locator)

    begin

      @driver.find_element(locator).displayed?

    rescue Selenium::WebDriver::Error::NoSuchElementError

      false

    end
  end

end