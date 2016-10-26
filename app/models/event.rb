class Event <  ApplicationRecord
  extend Enumerize
  validates :name, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true

  enumerize :cancel_activities, in: { no_cancel: 0 ,
                                      all_lessons_in_day: 1,
                                      all_conflicted: 3 }
end
