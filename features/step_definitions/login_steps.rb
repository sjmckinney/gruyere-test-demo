Given(/^the user logs in with the credentials "([^"]*)" and "([^"]*)"$/) do |username, password|

  $login = Login.new(@driver)
  $login.login(username, password)

end

Then(/^the username "([^"]*)" should be displayed$/) do |dsiplayed_username|

  displayed_username = $login.get_displayed_username
  expect(displayed_username).to eql(dsiplayed_username)

end


Then(/^the message "([^"]*)" should be displayed$/) do |message|

  displayed_error = $login.get_displayed_error
  expect(displayed_error).to eql(message)

end