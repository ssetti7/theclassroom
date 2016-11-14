module EventsHelper
  def render_week_days(events)
    render partial: 'scaffold/widgets/weekday_card/weekday',
           collection: build_days_struct(events), as: :day
  end

  def render_day_events(events)
    return no_events unless events.any?
    render partial: 'scaffold/widgets/weekday_card/day_event',
           collection: events, as: :event
  end
  def no_events
    render partial: 'scaffold/widgets/weekday_card/no_events'
  end
  private

  def build_days_struct(events)
    today = Time.zone.today
    (today.beginning_of_week .. today.end_of_week).map do |day|
      TheClassroom::WeekDay.new(day: day, events: events).
        build_day_struct
    end
  end
end

