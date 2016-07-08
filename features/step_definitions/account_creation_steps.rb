Given(/^a user without an account provides new credentials$/) do

  start_page = StartPage.new(@driver)
  home_page = start_page.agree_and_start
  @sign_up_page = home_page.click_sign_up

end

Then(/^an account will be created and the message "([^"]*)" displayed$/) do |message|

  success_msg = @sign_up_page.create_account(Utilities.random_string(8), ENV['account_password'])
  expect(success_msg).to eq(message)

end