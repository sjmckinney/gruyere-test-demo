Given(/^the user logs in with the credentials "([^"]*)" and "([^"]*)"$/) do |username, password|

  home_page = HomePage.new(@driver)

  @login_page = home_page.click_sign_in
  @login_page.login(username, password)

end

Then(/^the username "([^"]*)" should be displayed$/) do |expected_username|

  displayed_username = @login_page.get_displayed_username
  expect(displayed_username).to eql(expected_username)

end


Then(/^the message "([^"]*)" should be displayed$/) do |message|

  displayed_error = @login_page.get_displayed_error
  expect(displayed_error).to eql(message)

end

Given(/^a valid user logs in$/) do

  @home_page = HomePage.new(@driver)
  @login_page = @home_page.click_sign_in
  @login_page.login("#{ENV['account_login']}", "#{ENV['account_password']}")

end
