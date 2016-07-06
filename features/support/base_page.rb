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

  def click_button(locator)

    @driver.find_element(locator).click

  end

  def get_text(locator)

    @driver.find_element(locator).text

  end

end