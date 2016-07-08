class StartPage < BasePage

  TERMS ||= {:css => "[href='http://code.google.com/terms.html']"}
  AGREE_AND_START ||= {:link_text => 'Agree & Start'}
  NEW_SESSION_ID ||= {:tag_name => 'body'}

  def initialize(driver)

    super

    @driver = driver

    url = "#{ENV['url']}/start"

    visit url

    raise 'Start page not ready' unless
        find( TERMS ).displayed?

    $LOG.info("Page at #{url} opened.")

  end



  def agree_and_start

    new_session_id = get_text(NEW_SESSION_ID)[/\d+/]

    click_link(AGREE_AND_START)

    LoginPage.new(@driver, new_session_id)

  end

end