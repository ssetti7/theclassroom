module CoreExtensions
  module PrettyDates
    def meridian_hour
      strftime('%I:%M%p')
    end
  end
end

Time.send :include, CoreExtensions::PrettyDates
