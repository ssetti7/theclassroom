When(/^The user is logged in the system$/) do
  visit new_user_session_path
  user = FactoryGirl.create :user
  fill_in('user_email', :with => user.email)
  fill_in('Password', :with => user.password)
  click_button 'Log in'
  end

Given(/^the user is not authenticated$/) do
end