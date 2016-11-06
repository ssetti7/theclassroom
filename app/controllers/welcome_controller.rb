class WelcomeController < ApplicationController
  def index
    @events = EventsForWeekByDay.all(day: Time.zone.today)
  end
end
