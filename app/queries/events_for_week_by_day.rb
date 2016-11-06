class EventsForWeekByDay
  def self.all(args)
    new(args).all
  end

  def self.grouped(args)
    new(args).grouped
  end

  def initialize(args)
    @day = args[:day]
  end

  attr_reader :day

  def all
    Event.where(start_time: first_day_of_week..last_day_of_week)
  end

  def first_day_of_week
    @day.at_beginning_of_week.beginning_of_day
  end

  def last_day_of_week
    @day.at_end_of_week.at_end_of_day
  end
end
