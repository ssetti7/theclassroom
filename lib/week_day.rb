# class Weekday builds a Day for the current week
class WeekDay
  attr_reader :day, :events

  def initialize(attrs)
    @day = attrs[:day]
    @events = attrs[:events]
  end

  def build_day_struct
    OpenStruct.new(width_class: width_class,
                   name: @day.strftime("%A"),
                   class_name: day_class,
                   events: build_event_list)
  end

  private

  def build_event_list
    events.collect do |event|
      event if event.start_time.wday == @day.wday
    end.compact
  end

  def width_class
    return 'col-md-3' unless @day.wday.between?(1, 3)
    'col-md-4'
  end

  def day_class
    today = Time.zone.today
    return 'today' if @day == today
    return 'past-day' if today > day
    'future-day'
  end
end
