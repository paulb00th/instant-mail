
Given /^the application is opened for the first time$/ do
  launch_app app_path
end

Then /^I should see the application settings screen$/ do
  verify_mail_settings_screen_is_showing
end

Given /^I enter a valid email address for the recipient$/ do
  type_into_settings_text_field('test@paulbooth.com', 'Recipient')
end

Given /^I press the 'Done' button$/ do
  touch( "button marked:'Done'" )
end

Then /^I should see the email entry screen$/ do
  verify_mail_composer_screen_is_showing
end

Given /^I have entered an invalid email address for the recipient$/ do
  type_into_settings_text_field('not_a_valid_email', 'Recipient')
end

Then /^I should still see the application settings screen$/ do
  wait_for_nothing_to_be_animating
  verify_mail_settings_screen_is_showing
end
