And(/^should see the event listed in the proper day$/) do
  expect(page).to have_css('.weekday-card.today .event-title')
end