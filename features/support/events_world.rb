module EventsWorld
  def fill_and_send_event_form
    event_data = FactoryGirl.attributes_for :event
    page.fill_in 'Name', with: event_data[:name]
    page.fill_in 'Description', with: event_data[:description]
    page.fill_in 'Start time', with: event_data[:start_time]
    page.fill_in 'End time', with: event_data[:end_time]

    click_button('Save')
  end

  def create_event_for_today
    today = Time.zone.today
    @today_event || FactoryGirl.create(:today_event,
                                       start_time: today.at_beginning_of_day,
                                       end_time: today.at_noon )
  end
end
World(EventsWorld)