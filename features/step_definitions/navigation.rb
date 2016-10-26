When(/^the user visit the home page$/) do
  visit root_path
end

When(/^visit create event view$/) do
  visit new_event_path
end

When(/^should be redirected to login view$/) do
  expect(page).to have_css('.section-title', text: 'Log in')
end
