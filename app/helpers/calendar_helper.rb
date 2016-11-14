module CalendarHelper
  def calendar(date = Date.today)
    TheClassroom::Calendar.new(self, date).table
  end
end
