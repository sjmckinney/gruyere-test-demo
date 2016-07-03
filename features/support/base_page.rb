require 'selenium-webdriver'

class BasePage

  def enter_text(css, text)

    @driver.find_element(css).send_keys(text)

  end

  def click_button css

    @driver.find_element(css).click

  end

end