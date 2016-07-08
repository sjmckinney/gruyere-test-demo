Given(/^a user without an account provides new credentials$/) do

  $start_page = StartPage.new(@driver)
  $login_page = $start_page.agree_and_start

end

Then(/^an account will be created and the message "([^"]*)" displayed$/) do |message|

  success_msg = $login_page.sign_up
  expect(success_msg).to eq(message)

end