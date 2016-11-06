FactoryGirl.define do
  factory :event do
    name 'MyText'
    description 'MyText'
    start_time '2016-10-21 23:51:38'
    end_time '2016-10-21 23:51:38'
    user_id 1
  end

  factory :today_event, class: Event do
    name 'This happend today'
    description 'MyText'
    start_time Time.zone.now.at_beginning_of_day
    end_time Time.zone.now.at_midday
    user_id 1
  end
end
