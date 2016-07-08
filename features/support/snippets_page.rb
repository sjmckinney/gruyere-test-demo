class SnippetsPage < BasePage

  CONTENT ||= {:css => '.content>a'}
  SNIPPETS ||= {:css => 'td div'}

  def initialize(driver)

    super

    @driver = driver

    raise 'Snippets page not ready' unless
      is_displayed?(CONTENT)

    $LOG.info("Page at #{@driver.current_url} opened.")

  end

  def snippet_exists?(text)
    
    snippet_row_id = -1

    snippets = find_all(SNIPPETS)
    
    snippets.each do |snippet|
      
      if(snippet.text == text)
        
        snippet_row_id = snippet['id']
        
      end

    end
    
    if(snippet_row_id.eql?(-1))

      $LOG.info("Snippet #{text} is not displayed")

    else

      $LOG.info("Snippet with text #{text} located in row #{snippet_row_id}")

    end

    snippet_row_id
    
  end

  def get_snippet_text(snippet_location)

    snippet_locator = {:id => "#{snippet_location}"}
    get_text(snippet_locator)

  end

  def delete_snippet(snippet_location)

    delete_snippet_locator = {:css => "[href$='deletesnippet?index=#{snippet_location}']"}
    click_link(delete_snippet_locator)

  end

  def delete_snippet_via_url(snippet)

    if(snippet == 'My new snippet one' )

      visit("#{ENV['url']}/#{ENV['session_id']}/deletesnippet?index=0")

    end

  end
  
end