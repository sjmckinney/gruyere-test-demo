require_relative 'base_page'

class Login < BasePage

  LOGIN_FORM = {:css => "[action$='/login']"}
  USER_NAME_FIELD = {:css => "[name='uid']"}
  PASSWORD_FIELD = {:css => "[name='pw']"}
  LOGIN_BTN = {:css => "[value='Login']"}
  DISPLAYED_USER = {:css => '.menu-user'}
  DISPLAYED_ERROR = {:css => '.message'}

  def initialize(driver)

    super

    url = "#{ENV['url']}/#{ENV['session_id']}/login"

    visit url

    raise 'Login page not ready' unless

        find( LOGIN_FORM ).displayed?
        $LOG.info("Page at #{url} opened.")

  end

  def enter_user_name username

    enter_text(USER_NAME_FIELD, username)

  end

  def enter_password password

    enter_text(PASSWORD_FIELD, password)

  end

  def login(username, password)

    enter_user_name username
    enter_password password
    click_button LOGIN_BTN

  end

  def get_displayed_username

    get_text(DISPLAYED_USER)

  end

  def get_displayed_error

    get_text(DISPLAYED_ERROR)

  end

end