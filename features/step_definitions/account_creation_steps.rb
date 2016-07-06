Given(/^a user without an account provides new credentials$/) do

  $start_page = StartPage.new(@driver)
  $login_page = $start_page.agree_and_start

end

Then(/^an account in that name will be created$/) do

  success_msg = $login_page.sign_up
  expect(success_msg).to eq("Account created")

end