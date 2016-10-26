And(/^fill the event form with the valid data$/) do
  fill_and_send_event_form
end

And(/^should see a message saying that creation succeed$/) do
  should_see_message 'Event was successfully created'
end

# Event was successfully created.