require_relative 'base_page'
require_relative 'sign_up_page'
require_relative 'utilities'

include 'Utilities'

class LoginPage < BasePage

  LOGIN_FORM = {:css => "[action$='/login']"}
  USER_NAME_FIELD = {:css => "[name='uid']"}
  PASSWORD_FIELD = {:css => "[name='pw']"}
  LOGIN_BTN = {:css => "[value='Login']"}
  DISPLAYED_USER = {:css => '.menu-user'}
  DISPLAYED_ERROR = {:css => '.message'}
  SIGN_IN_LINK = {:css => "[href$='/newaccount.gtl']"}

  def initialize(driver, session_id = "#{ENV['session_id']}")

    super(driver)

    @driver = driver
    @session_id = session_id

    url = "#{ENV['url']}/#{session_id}/login"

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

  def sign_up

    click_link(SIGN_IN_LINK)
    sign_up_page = SignUpPage.new(@driver, @session_id)
    sign_up_page.sign_up(Utilities.random_string(10) ,ENV['account_password'])

  end

end