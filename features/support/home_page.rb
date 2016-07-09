require_relative 'login_page'

class HomePage < BasePage

  CHEDDAR_TEXT = {:id => 'cheddar'}
  SIGN_IN_LINK_TEXT = {:link_text => 'Sign in'}
  SIGN_UP_LINK_TEXT = {:link_text => 'Sign up'}

  def initialize(driver)

    super

    @driver = driver

    url = "#{ENV['url']}/#{ENV['session_id']}"

    visit url

    raise 'Snippets page not ready' unless
      is_displayed?(CHEDDAR_TEXT)

    $LOG.info("Page at #{@driver.current_url} opened.")

  end

  def click_sign_in

    begin

      click_link(SIGN_IN_LINK_TEXT)

      wait_for(5) { !(is_displayed?(CHEDDAR_TEXT)) }

      LoginPage.new(@driver)

    rescue Exception => e

      $LOG.info("Error has occurred in : #{__FILE__} @ line #{__LINE__}")
      $LOG.error("Error.message: #{e.message}")
      $LOG.debug("Error.backtrace: #{e.backtrace}")
      take_screenshot(__FILE__, __LINE__)
      raise

    end

  end

  def click_sign_up

    begin

      click_link(SIGN_UP_LINK_TEXT)

      wait_for(5) { !(is_displayed?(CHEDDAR_TEXT)) }

      SignUpPage.new(@driver)

    rescue Exception => e

      $LOG.info("Error has occurred in : #{__FILE__} @ line #{__LINE__}")
      $LOG.error("Error.message: #{e.message}")
      $LOG.debug("Error.backtrace: #{e.backtrace}")
      take_screenshot(__FILE__, __LINE__)
      raise

    end

  end


end