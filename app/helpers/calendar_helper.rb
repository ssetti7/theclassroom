module CalendarHelper
  def calendar(date = Date.today)
    Calendar.new(self, date).table
  end
end