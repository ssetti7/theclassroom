require 'ostruct'
require 'week_day'
require 'spec_time_helper'

describe WeekDay do

  let(:today) { Time.zone.today }
  let(:events) { [event1, event2, event3 ]}
  let(:event1) { FactoryGirl.create :event, { start_time: today } }
  let(:event2) { FactoryGirl.create :event, { start_time: today.next } }
  let(:event3) { FactoryGirl.create :event, { start_time: today } }

  subject do
    WeekDay.new(day: today, events: events).build_day_struct
  end

  describe '#build_day_struct' do
    it 'return the proper width class' do
      expect(subject.width_class).to be_eql 'col-md-3'
    end

    it 'return today class name' do
      expect(subject.class_name).to be_eql 'today'
    end

    it 'expect to have 2 days assigned' do
      expect(subject.events).to be_eql [event1, event3]
    end
  end
end
