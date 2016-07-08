class BasePage

  def initialize(driver)

    @driver = driver

  end

  def visit(url)

    @driver.get(url)

  end

  def find(locator)

    @driver.find_element(locator)

  end

  def enter_text(locator, text)

    @driver.find_element(locator).send_keys(text)

  end

  def click_element(locator)

    @driver.find_element(locator).click

  end

  def click_button(locator)

    click_element(locator)

  end

  def click_link(locator)

    click_element(locator)

  end

  def get_text(locator)

    @driver.find_element(locator).text

  end

  def wait_for(seconds = 15)

    Selenium::WebDriver::Wait.new(:timeout => seconds).until { yield }

  end

end