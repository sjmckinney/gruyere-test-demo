Given(/^a user uploads the file "([^"]*)"$/) do |file_name|

  @file_name = file_name
  @upload_page = @home_page.click_upload_file
  @upload_page.upload_file(@file_name)

end

Then(/^a file access url will be displayed$/) do

  upload_complete = @upload_page.get_file_location_message
  expected_message = "File uploaded!\nFile accessible at: #{ENV['url'].sub('s', '')}/#{ENV['session_id']}/#{ENV['account_login']}/#{@file_name}"

  expect(upload_complete).to eq(expected_message)

end

Then(/^the error message "([^"]*)" will be displayed$/) do |error_msg|

  upload_error = @upload_page.get_file_upload_error_message
  expect(upload_error).to eq(error_msg)

end

Then(/^the no file error message "([^"]*)" will be displayed$/) do |error_msg|

  no_file_message = @upload_page.get_no_file_error_message
  expect(no_file_message).to eq(error_msg)

end

Given(/^a user does not select a file to upload$/) do

  @upload_page = @home_page.click_upload_file
  @upload_page.click_upload_button

end

