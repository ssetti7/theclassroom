And(/^fill the event form with the valid data$/) do
  fill_and_send_event_form
end

And(/^there is an event scheduled for today$/) do
  create_event_for_today
end

And(/^should see a message saying that the event creation succeed$/) do
  should_see_message 'Event was successfully created'
end
