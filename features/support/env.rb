require 'selenium-webdriver'
require 'dotenv'

Dotenv.load '.env'

Before do |scenario|

  @driver = Selenium::WebDriver.for (ENV['browser']).to_sym

end

After do |scenario|

  @driver.quit

end