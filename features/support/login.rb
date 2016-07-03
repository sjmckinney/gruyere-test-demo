require_relative 'base_page'

class Login < BasePage

  LOGIN_FORM = {:css => ''}
  USER_NAME_FIELD = {:name => 'uid'}
  PASSWORD_FIELD = {:name => 'pw'}
  LOGIN_BTN = {:value => 'Login'}

  def initialize(driver)

    @driver = driver

    @driver.get "#{ENV['url']}/#{ENV['session_id']}/login"

    raise 'Login page not ready' unless

        @driver.find_element( LOGIN_FORM ).displayed?

  end

  def enter_user_name username

    @driver.find_element(USER_NAME_FIELD).send_keys(username)

  end

  def enter_password password

    @driver.find_element(PASSWORD_FIELD_FIELD).send_keys(password)

  end

  def login

    enter_user_name ENV['username']
    enter_password ENV['password']

  end

end