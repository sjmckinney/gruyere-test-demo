class NewSnippetPage < BasePage

  TEXT_AREA ||= {:tag_name => 'textarea'}
  SUBMIT_BUTTON ||= {:tag_name => 'input'}

  def initialize(driver)

    super

    @driver = driver

    raise 'New snippet page not ready' unless
      is_displayed?(TEXT_AREA) == true

    $LOG.info("Page at #{@driver.current_url} opened.")

  end

  def add_snippet(text)

    enter_text(TEXT_AREA, text)
    click_button(SUBMIT_BUTTON)
    SnippetsPage.new(@driver)

  end


end