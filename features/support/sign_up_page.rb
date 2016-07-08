class SignUpPage < BasePage

  SIGN_UP_FORM ||= {:css => "form[action$='/saveprofile']"}
  USERNAME_FIELD ||= {:name => 'uid'}
  PASSWORD_FIELD ||= {:name => 'pw'}
  CREATE_ACCT_BUTTON ||= {:css => "[value='Create account']"}
  SUCCESS_MESSAGE ||= {:css => '.message'}

  def initialize(driver, new_session_id)

    super driver

    url = "#{ENV['url']}/#{new_session_id}/newaccount.gtl"

    visit url

    raise 'Sign up page not ready' unless
        find( SIGN_UP_FORM ).displayed?

    $LOG.info("Page at #{url} opened.")

  end

  def create_account(username, password)

    enter_text(USERNAME_FIELD, username)
    enter_text(PASSWORD_FIELD, password)
    click_button(CREATE_ACCT_BUTTON)

    wait_for(10) { (find SUCCESS_MESSAGE).displayed? }
    get_text(SUCCESS_MESSAGE)

  end

end