Given(/^a user creates a snippet "([^"]*)"$/) do |snippet_text|

  @snippet_text = snippet_text

  home_page = HomePage.new(@driver)
  login_page = home_page.click_sign_in
  login_page.login(ENV['account_login'], ENV['account_password'])
  new_snippet_page = login_page.click_new_snippet_link
  @snippets_page = new_snippet_page.add_snippet(@snippet_text)

end

And(/^the snippet will be|is displayed$/) do

  @snippet_location = @snippets_page.snippet_exists?(@snippet_text)
  saved_snippet_text = @snippets_page.get_snippet_text(@snippet_location)
  expect(@snippet_text).to eq(saved_snippet_text)

end

When(/^the user deletes the snippet$/) do

  @snippets_page.delete_snippet(@snippet_location)

end

Then(/^the snippet will no longer be displayed$/) do

  @snippet_location = @snippets_page.snippet_exists?(@snippet_text)
  expect(@snippet_location).to eq(-1)

end