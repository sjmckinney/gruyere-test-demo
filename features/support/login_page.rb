require_relative 'base_page'
require_relative 'sign_up_page'
require_relative 'new_snippet_page'
require_relative 'snippets_page'

class LoginPage < BasePage

  LOGIN_FORM ||= {:css => "[action$='/login']"}
  USER_NAME_FIELD ||= {:name => 'uid'}
  PASSWORD_FIELD ||= {:name => 'pw'}
  LOGIN_BUTTON ||= {:css => "[value='Login']"}
  DISPLAYED_USER ||= {:css => '.menu-user'}
  DISPLAYED_ERROR ||= {:css => '.message'}
  SIGN_IN_LINK ||= {:css => "[href$='/newaccount.gtl']"}
  NEW_SNIPPET_LINK ||= {:link_text => 'New Snippet'}
  FIVE_SECS ||= 5

  def initialize(driver)

    super(driver)

    @driver = driver

    raise 'Login page not ready' unless
      is_displayed?(LOGIN_FORM)

    $LOG.info("Page at #{@driver.current_url} opened.")

  end

  def enter_user_name(username)

    enter_text(USER_NAME_FIELD, username)
    $LOG.info("Entered username #{username}")

  end

  def enter_password(password)

    enter_text(PASSWORD_FIELD, password)
    $LOG.info("Entered password #{password}")

  end

  def login(username, password)

    enter_user_name(username)
    enter_password(password)
    click_button(LOGIN_BUTTON)

    if(!(is_displayed?(DISPLAYED_ERROR)))
      HomePage.new(@driver)
    end

  end

  def get_displayed_username

    displayed_username = get_text(DISPLAYED_USER)
    $LOG.info("Displayed username is #{displayed_username}")
    displayed_username

  end

  def get_displayed_error

    wait_for(FIVE_SECS) {is_displayed?(DISPLAYED_ERROR)}
    displayed_error = get_text(DISPLAYED_ERROR)
    $LOG.info("Displayed error is #{displayed_error}")
    displayed_error

  end

  def click_new_snippet_link

    wait_for(FIVE_SECS) { is_displayed?(NEW_SNIPPET_LINK)}
    click_link(NEW_SNIPPET_LINK)

    NewSnippetPage.new(@driver)

  end

end