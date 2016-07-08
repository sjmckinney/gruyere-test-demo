class SignUpPage < BasePage

  SIGN_UP_FORM ||= {:css => "form[action$='/saveprofile']"}
  USERNAME_FIELD ||= {:name => 'uid'}
  PASSWORD_FIELD ||= {:name => 'pw'}
  CREATE_ACCT_BUTTON ||= {:css => "[value='Create account']"}
  SUCCESS_MESSAGE ||= {:css => '.message'}

  def initialize(driver)

    super

    @driver = driver

    raise 'Sign up page not ready' unless
      is_displayed?(SIGN_UP_FORM)

    $LOG.info("Page at #{@driver.current_url} opened.")

  end

  def create_account(username, password)

    enter_text(USERNAME_FIELD, username)
    enter_text(PASSWORD_FIELD, password)
    click_button(CREATE_ACCT_BUTTON)

    wait_for(10) { (find SUCCESS_MESSAGE).displayed? }
    success_message = get_text(SUCCESS_MESSAGE)
    $LOG.info("Displayed message is #{success_message}")
    success_message

  end

end