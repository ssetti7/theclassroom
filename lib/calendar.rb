class Calendar < Struct.new(:view, :date, :callback)
  delegate :content_tag, to: :view

  START_DAY = :sunday

  def table
    content_tag :table, class: 'calendar table table-bordered table-striped' do
      header + week_rows
    end
  end

  def header
    content_tag :tr do
      Date::DAYNAMES.map { |day| content_tag :th, day }.join.html_safe
    end
  end

  def week_rows
    weeks.map do |week|
      content_tag :tr do
        week.map { |day| day_cell(day)}.join.html_safe
      end
    end.join.html_safe
  end

  def day_cell(day)
    content_tag :td, view.capture(day, &callback), class: day_classes(day)
  end

  def day_classes(day)
    class_list = []
    class_list << 'today' if day.today?
    class_list << 'not-month' if date.month != day.month
    class_list.join(' ')
  end

  def weeks
    first = date.beginning_of_month.beginning_of_week(START_DAY)
    last = date.end_of_month.end_of_week(START_DAY)
    (first .. last).to_a.in_groups_of(7)
  end
end